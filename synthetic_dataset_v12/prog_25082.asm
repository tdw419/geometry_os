; DESCRIPTION: Renders a blue box of size 24x119 starting at (294, 78).
; PLAN: r0=294(x), r1=78(y), r2=24(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 78
LDI r2, 24
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
