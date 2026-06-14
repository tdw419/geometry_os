; PixelPack Seed: 0x01345678 (20207224)
; Pattern=0, ColorA=0xFF0000, ColorB=0x0000FF
; Density=5, Offset=(86,120)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFF0000  ; Color A
LDI r11, 0x0000FF  ; Color B

; Pattern 0: Solid fill
LDI r20, 86
LDI r21, 120
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r10

FRAME
HALT
