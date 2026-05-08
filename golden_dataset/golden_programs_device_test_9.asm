; DESCRIPTION: This GeOS assembly code initializes and tests device drivers for a screen, keyboard, audio, and network interface. It opens each device file, queries their properties using IOCTL commands, and enters an interactive loop where it reads key presses from the keyboard to randomly draw pixels on the screen while emitting a beep sound through the audio device.

; device_test.asm -- Phase 28: Device Driver Abstraction demo
; Opens all 4 device files, uses IOCTL to query them,
; reads from /dev/keyboard, writes pixels to /dev/screen.
;
; Controls: Press any key to draw a pixel at a random position
; Opcodes: OPEN, READ, WRITE, IOCTL, LDI, LOAD, STORE, RAND, FRAME, HALT

; -- Data area --
.org 0xD00
screen_path:
    .db "/dev/screen", 0
kb_path:
    .db "/dev/keyboard", 0
audio_path:
    .db "/dev/audio", 0
net_path:
    .db "/dev/net", 0
pixel_buf:
    .db 0, 0, 0   ; x, y, color triplet for screen write
key_buf:
    .db 0         ; buffer for keyboard read
result:
    .db 0         ; stores ioctl results

; -- Main program --
.org 0x000
    ; Fill screen with dark blue background
    LDI r6, 0x000033
    FILL r6

    ; Draw title bar
    LDI r7, 0
    LDI r1, 0
    LDI r11, 256
    LDI r2, 16
    LDI r6, 0x003366
    RECTF r7, r1, r11, r2, r6

    ; Draw status bar at bottom
    LDI r7, 0
    LDI r1, 240
    LDI r11, 256
    LDI r2, 16
    LDI r6, 0x003366
    RECTF r7, r1, r11, r2, r6

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r7, screen_path
    LDI r1, 0
    OPEN r7, r1
    ; r9 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r7, kb_path
    LDI r1, 0
    OPEN r7, r1
    ; r9 = 0xE001 (keyboard fd), save to r3
    MOV r3, r9

    ; /dev/audio -> fd 0xE002
    LDI r7, audio_path
    LDI r1, 0
    OPEN r7, r1
    ; r9 = 0xE002 (audio fd), save to r12
    MOV r12, r9

    ; /dev/net -> fd 0xE003
    LDI r7, net_path
    LDI r1, 0
    OPEN r7, r1
    ; r9 = 0xE003 (net fd), save to r14
    MOV r14, r9

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r15, 0xE000
    LDI r5, 0
    LDI r8, 0
    IOCTL r15, r5, r8
    ; r9 = 256 (width), store it
    LDI r20, result
    STORE r20, r9

    ; Get screen height (cmd=1) -- should return 256
    LDI r15, 0xE000
    LDI r5, 1
    LDI r8, 0
    IOCTL r15, r5, r8
    ; r9 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r15, 0xE001
    LDI r5, 1
    LDI r8, 1
    IOCTL r15, r5, r8
    ; r9 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r15, 0xE002
    LDI r5, 1
    LDI r8, 50
    IOCTL r15, r5, r8
    ; r9 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r15, 0xE003
    LDI r5, 0
    LDI r8, 0
    IOCTL r15, r5, r8
    ; r9 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r7, key_buf
    LDI r1, 1
    READ r3, r7, r1
    ; r9 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r11, 0
    CMP r9, r11
    JZ r9, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r9
    LDI r11, 255
    AND r9, r11       ; r9 = random x (0-255)

    RAND r7
    AND r7, r11       ; r7 = random y (0-255)

    RAND r1
    AND r1, r11       ; r1 = random color component

    ; Make it brighter (add 0x111111)
    LDI r11, 0x111111
    ADD r1, r11

    ; Draw pixel directly
    PSETI r9, r7, r1

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r7, pixel_buf
    LDI r1, 440
    STORE r7, r1
    LDI r1, 1
    ADD r7, r1       ; r7 = pixel_buf + 1
    LDI r1, 50
    STORE r7, r1
    LDI r7, pixel_buf
    LDI r1, 2
    WRITE r12, r7, r1

skip:
    FRAME
    JMP loop
