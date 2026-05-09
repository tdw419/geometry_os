; DESCRIPTION: Renders a blue box of size 29x79 starting at (118, 144).
; PLAN: r0=118(x), r1=144(y), r2=29(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 144
LDI r2, 29
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
