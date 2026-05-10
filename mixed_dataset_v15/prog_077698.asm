; DESCRIPTION: Creates a blue filled rectangle of size 107x21 starting at (325, 136).
; PLAN: r0=325(x), r1=136(y), r2=107(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 136
LDI r2, 107
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
