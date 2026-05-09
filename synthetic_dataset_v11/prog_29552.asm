; DESCRIPTION: Renders a blue box of size 14x75 starting at (18, 93).
; PLAN: r0=18(x), r1=93(y), r2=14(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 93
LDI r2, 14
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
