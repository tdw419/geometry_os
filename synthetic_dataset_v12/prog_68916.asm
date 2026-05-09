; DESCRIPTION: Renders a blue box of size 37x109 starting at (223, 52).
; PLAN: r0=223(x), r1=52(y), r2=37(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 52
LDI r2, 37
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
