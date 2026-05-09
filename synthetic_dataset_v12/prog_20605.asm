; DESCRIPTION: Renders a blue box of size 37x61 starting at (325, 114).
; PLAN: r0=325(x), r1=114(y), r2=37(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 114
LDI r2, 37
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
