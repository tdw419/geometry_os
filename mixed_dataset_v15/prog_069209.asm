; DESCRIPTION: Renders a blue box of size 93x55 starting at (297, 185).
; PLAN: r0=297(x), r1=185(y), r2=93(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 185
LDI r2, 93
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
