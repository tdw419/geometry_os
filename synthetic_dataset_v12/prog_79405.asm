; DESCRIPTION: Renders a blue box of size 59x119 starting at (391, 73).
; PLAN: r0=391(x), r1=73(y), r2=59(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 73
LDI r2, 59
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
