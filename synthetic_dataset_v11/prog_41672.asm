; DESCRIPTION: Renders a blue box of size 112x24 starting at (75, 124).
; PLAN: r0=75(x), r1=124(y), r2=112(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 124
LDI r2, 112
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
