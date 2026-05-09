; DESCRIPTION: Renders a blue box of size 12x71 starting at (13, 17).
; PLAN: r0=13(x), r1=17(y), r2=12(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 17
LDI r2, 12
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
