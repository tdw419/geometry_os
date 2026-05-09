; DESCRIPTION: Renders a blue box of size 64x83 starting at (371, 107).
; PLAN: r0=371(x), r1=107(y), r2=64(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 107
LDI r2, 64
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
