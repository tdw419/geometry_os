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
    LDI r5, 0x000033
    FILL r5

    ; Draw title bar
    LDI r4, 0
    LDI r6, 0
    LDI r12, 256
    LDI r14, 16
    LDI r5, 0x003366
    RECTF r4, r6, r12, r14, r5

    ; Draw status bar at bottom
    LDI r4, 0
    LDI r6, 240
    LDI r12, 256
    LDI r14, 16
    LDI r5, 0x003366
    RECTF r4, r6, r12, r14, r5

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r4, screen_path
    LDI r6, 0
    OPEN r4, r6
    ; r2 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r4, kb_path
    LDI r6, 0
    OPEN r4, r6
    ; r2 = 0xE001 (keyboard fd), save to r10
    MOV r10, r2

    ; /dev/audio -> fd 0xE002
    LDI r4, audio_path
    LDI r6, 0
    OPEN r4, r6
    ; r2 = 0xE002 (audio fd), save to r9
    MOV r9, r2

    ; /dev/net -> fd 0xE003
    LDI r4, net_path
    LDI r6, 0
    OPEN r4, r6
    ; r2 = 0xE003 (net fd), save to r15
    MOV r15, r2

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r11, 0xE000
    LDI r0, 0
    LDI r8, 0
    IOCTL r11, r0, r8
    ; r2 = 256 (width), store it
    LDI r20, result
    STORE r20, r2

    ; Get screen height (cmd=1) -- should return 256
    LDI r11, 0xE000
    LDI r0, 1
    LDI r8, 0
    IOCTL r11, r0, r8
    ; r2 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r11, 0xE001
    LDI r0, 1
    LDI r8, 1
    IOCTL r11, r0, r8
    ; r2 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r11, 0xE002
    LDI r0, 1
    LDI r8, 50
    IOCTL r11, r0, r8
    ; r2 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r11, 0xE003
    LDI r0, 0
    LDI r8, 0
    IOCTL r11, r0, r8
    ; r2 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r4, key_buf
    LDI r6, 1
    READ r10, r4, r6
    ; r2 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r12, 0
    CMP r2, r12
    JZ r2, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r2
    LDI r12, 255
    AND r2, r12       ; r2 = random x (0-255)

    RAND r4
    AND r4, r12       ; r4 = random y (0-255)

    RAND r6
    AND r6, r12       ; r6 = random color component

    ; Make it brighter (add 0x111111)
    LDI r12, 0x111111
    ADD r6, r12

    ; Draw pixel directly
    PSETI r2, r4, r6

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r4, pixel_buf
    LDI r6, 440
    STORE r4, r6
    LDI r6, 1
    ADD r4, r6       ; r4 = pixel_buf + 1
    LDI r6, 50
    STORE r4, r6
    LDI r4, pixel_buf
    LDI r6, 2
    WRITE r9, r4, r6

skip:
    FRAME
    JMP loop
