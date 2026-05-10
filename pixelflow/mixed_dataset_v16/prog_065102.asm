; DESCRIPTION: Renders a blue box of size 81x96 starting at (183, 5).
; PLAN: r0=183(x), r1=5(y), r2=81(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 5
LDI r2, 81
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
