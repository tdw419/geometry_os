; PixelPack Seed: 0x9ABCDEF0 (2596069104)
; Pattern=9, ColorA=0x0088FF, ColorB=0x88FF00
; Density=13, Offset=(222,240)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x0088FF  ; Color A
LDI r11, 0x88FF00  ; Color B

; Pattern 9: Gradient bars
LDI r10, 0x000000
LDI r20, 0
LDI r21, 0
LDI r22, 52
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r10, 0x101010
LDI r20, 52
LDI r21, 0
LDI r22, 52
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r10, 0x202020
LDI r20, 104
LDI r21, 0
LDI r22, 52
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r10, 0x303030
LDI r20, 156
LDI r21, 0
LDI r22, 52
LDI r23, 256
RECTF r20, r21, r22, r23, r10

FRAME
HALT
