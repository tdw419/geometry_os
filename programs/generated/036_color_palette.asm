; color_palette.asm -- 8x8 grid of color swatches
; Each swatch is 32x32 pixels, filling the 256x256 screen
; Rows cycle through hue families, columns vary brightness

; Row 0: Reds
LDI r0, 0
LDI r1, 0
LDI r2, 32
LDI r3, 32
LDI r4, 0x330000
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x660000
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x990000
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0xCC0000
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0xFF3333
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0xFF6666
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0xFF9999
RECTF r0, r1, r2, r3, r4

; Row 1: Greens
LDI r0, 0
LDI r1, 32
LDI r4, 0x003300
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x006600
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x009900
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0x00CC00
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0x33FF33
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0x66FF66
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0x99FF99
RECTF r0, r1, r2, r3, r4

; Row 2: Blues
LDI r0, 0
LDI r1, 64
LDI r4, 0x000033
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x000066
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x000099
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0x0000CC
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0x3333FF
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0x6666FF
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0x9999FF
RECTF r0, r1, r2, r3, r4

; Row 3: Yellows
LDI r0, 0
LDI r1, 96
LDI r4, 0x333300
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x666600
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x999900
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0xCCCC00
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0xFFFF33
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0xFFFF66
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0xFFFF99
RECTF r0, r1, r2, r3, r4

; Row 4: Cyans
LDI r0, 0
LDI r1, 128
LDI r4, 0x003333
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x006666
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x009999
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0x00CCCC
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0x33FFFF
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0x66FFFF
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0x99FFFF
RECTF r0, r1, r2, r3, r4

; Row 5: Magentas
LDI r0, 0
LDI r1, 160
LDI r4, 0x330033
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x660066
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x990099
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0xCC00CC
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0xFF33FF
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0xFF66FF
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0xFF99FF
RECTF r0, r1, r2, r3, r4

; Row 6: Oranges
LDI r0, 0
LDI r1, 192
LDI r4, 0x331100
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x663300
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x995500
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0xCC7700
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0xFF9900
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0xFFAA33
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0xFFBB66
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0xFFCC99
RECTF r0, r1, r2, r3, r4

; Row 7: Grays
LDI r0, 0
LDI r1, 224
LDI r4, 0x111111
RECTF r0, r1, r2, r3, r4

LDI r0, 32
LDI r4, 0x333333
RECTF r0, r1, r2, r3, r4

LDI r0, 64
LDI r4, 0x555555
RECTF r0, r1, r2, r3, r4

LDI r0, 96
LDI r4, 0x777777
RECTF r0, r1, r2, r3, r4

LDI r0, 128
LDI r4, 0x999999
RECTF r0, r1, r2, r3, r4

LDI r0, 160
LDI r4, 0xBBBBBB
RECTF r0, r1, r2, r3, r4

LDI r0, 192
LDI r4, 0xDDDDDD
RECTF r0, r1, r2, r3, r4

LDI r0, 224
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

; Grid lines for separation
LDI r4, 0x000000
LDI r2, 1
LDI r3, 256

; Vertical lines at x=32,64,...,224
LDI r0, 32
LDI r1, 0
RECTF r0, r1, r2, r3, r4

LDI r0, 64
RECTF r0, r1, r2, r3, r4

LDI r0, 96
RECTF r0, r1, r2, r3, r4

LDI r0, 128
RECTF r0, r1, r2, r3, r4

LDI r0, 160
RECTF r0, r1, r2, r3, r4

LDI r0, 192
RECTF r0, r1, r2, r3, r4

LDI r0, 224
RECTF r0, r1, r2, r3, r4

; Horizontal lines at y=32,64,...,224
LDI r2, 256
LDI r3, 1
LDI r0, 0

LDI r1, 32
RECTF r0, r1, r2, r3, r4

LDI r1, 64
RECTF r0, r1, r2, r3, r4

LDI r1, 96
RECTF r0, r1, r2, r3, r4

LDI r1, 128
RECTF r0, r1, r2, r3, r4

LDI r1, 160
RECTF r0, r1, r2, r3, r4

LDI r1, 192
RECTF r0, r1, r2, r3, r4

LDI r1, 224
RECTF r0, r1, r2, r3, r4

HALT
