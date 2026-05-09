; DESCRIPTION: Renders a blue box of size 93x66 starting at (375, 93).
; PLAN: r0=375(x), r1=93(y), r2=93(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 93
LDI r2, 93
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
