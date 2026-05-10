; DESCRIPTION: Renders a blue box of size 105x71 starting at (18, 38).
; PLAN: r0=18(x), r1=38(y), r2=105(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 38
LDI r2, 105
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
