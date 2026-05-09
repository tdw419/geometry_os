; DESCRIPTION: Renders a blue box of size 95x74 starting at (274, 4).
; PLAN: r0=274(x), r1=4(y), r2=95(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 4
LDI r2, 95
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
