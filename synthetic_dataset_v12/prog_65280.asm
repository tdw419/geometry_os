; DESCRIPTION: Renders a blue box of size 35x34 starting at (301, 17).
; PLAN: r0=301(x), r1=17(y), r2=35(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 17
LDI r2, 35
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
