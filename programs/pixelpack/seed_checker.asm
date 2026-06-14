; PixelPack Seed: 0x3456789A (878082202)
; Pattern=3, ColorA=0xFFFF00, ColorB=0xFF00FF
; Density=7, Offset=(120,154)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFFFF00  ; Color A
LDI r11, 0xFF00FF  ; Color B

; Pattern 3: Checkerboard
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 112
LDI r21, 0
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 56
LDI r21, 56
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 168
LDI r21, 56
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 112
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 112
LDI r21, 112
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 56
LDI r21, 168
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10
LDI r20, 168
LDI r21, 168
LDI r22, 56
LDI r23, 56
RECTF r20, r21, r22, r23, r10

FRAME
HALT
