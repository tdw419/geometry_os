; PixelPack Seed: 0xBCDE1234 (3168670260)
; Pattern=11, ColorA=0xFF0088, ColorB=0x00FF88
; Density=15, Offset=(18,52)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFF0088  ; Color A
LDI r11, 0x00FF88  ; Color B

; Pattern 11: Dots grid
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 30
LDI r23, 30
RECTF r20, r21, r22, r23, r10
LDI r20, 120
LDI r21, 0
LDI r22, 30
LDI r23, 30
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 120
LDI r22, 30
LDI r23, 30
RECTF r20, r21, r22, r23, r10
LDI r20, 120
LDI r21, 120
LDI r22, 30
LDI r23, 30
RECTF r20, r21, r22, r23, r10

FRAME
HALT
