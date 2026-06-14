; PixelPack Seed: 0xF2345678 (4063516280)
; Pattern=15, ColorA=0x00FF00, ColorB=0x0000FF
; Density=5, Offset=(86,120)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x00FF00  ; Color A
LDI r11, 0x0000FF  ; Color B

; Pattern 15: Four quadrants
LDI r20, 0
LDI r21, 0
LDI r22, 128
LDI r23, 128
RECTF r20, r21, r22, r23, r10
LDI r20, 128
LDI r21, 0
LDI r22, 128
LDI r23, 128
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 128
LDI r22, 128
LDI r23, 128
RECTF r20, r21, r22, r23, r11
LDI r20, 128
LDI r21, 128
LDI r22, 128
LDI r23, 128
RECTF r20, r21, r22, r23, r10

FRAME
HALT
