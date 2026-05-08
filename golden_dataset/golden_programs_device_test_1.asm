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
    LDI r3, 0x000033
    FILL r3

    ; Draw title bar
    LDI r0, 0
    LDI r14, 0
    LDI r10, 256
    LDI r6, 16
    LDI r3, 0x003366
    RECTF r0, r14, r10, r6, r3

    ; Draw status bar at bottom
    LDI r0, 0
    LDI r14, 240
    LDI r10, 256
    LDI r6, 16
    LDI r3, 0x003366
    RECTF r0, r14, r10, r6, r3

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r0, screen_path
    LDI r14, 0
    OPEN r0, r14
    ; r5 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r0, kb_path
    LDI r14, 0
    OPEN r0, r14
    ; r5 = 0xE001 (keyboard fd), save to r13
    MOV r13, r5

    ; /dev/audio -> fd 0xE002
    LDI r0, audio_path
    LDI r14, 0
    OPEN r0, r14
    ; r5 = 0xE002 (audio fd), save to r11
    MOV r11, r5

    ; /dev/net -> fd 0xE003
    LDI r0, net_path
    LDI r14, 0
    OPEN r0, r14
    ; r5 = 0xE003 (net fd), save to r2
    MOV r2, r5

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r12, 0xE000
    LDI r9, 0
    LDI r1, 0
    IOCTL r12, r9, r1
    ; r5 = 256 (width), store it
    LDI r20, result
    STORE r20, r5

    ; Get screen height (cmd=1) -- should return 256
    LDI r12, 0xE000
    LDI r9, 1
    LDI r1, 0
    IOCTL r12, r9, r1
    ; r5 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r12, 0xE001
    LDI r9, 1
    LDI r1, 1
    IOCTL r12, r9, r1
    ; r5 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r12, 0xE002
    LDI r9, 1
    LDI r1, 50
    IOCTL r12, r9, r1
    ; r5 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r12, 0xE003
    LDI r9, 0
    LDI r1, 0
    IOCTL r12, r9, r1
    ; r5 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r0, key_buf
    LDI r14, 1
    READ r13, r0, r14
    ; r5 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r10, 0
    CMP r5, r10
    JZ r5, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r5
    LDI r10, 255
    AND r5, r10       ; r5 = random x (0-255)

    RAND r0
    AND r0, r10       ; r0 = random y (0-255)

    RAND r14
    AND r14, r10       ; r14 = random color component

    ; Make it brighter (add 0x111111)
    LDI r10, 0x111111
    ADD r14, r10

    ; Draw pixel directly
    PSETI r5, r0, r14

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r0, pixel_buf
    LDI r14, 440
    STORE r0, r14
    LDI r14, 1
    ADD r0, r14       ; r0 = pixel_buf + 1
    LDI r14, 50
    STORE r0, r14
    LDI r0, pixel_buf
    LDI r14, 2
    WRITE r11, r0, r14

skip:
    FRAME
    JMP loop
