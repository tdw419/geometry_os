; DESCRIPTION: Renders a blue box of size 111x105 starting at (18, 95).
; PLAN: r0=18(x), r1=95(y), r2=111(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 95
LDI r2, 111
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
