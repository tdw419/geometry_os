; DESCRIPTION: Renders a blue box of size 119x71 starting at (272, 106).
; PLAN: r0=272(x), r1=106(y), r2=119(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 106
LDI r2, 119
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
