; DESCRIPTION: Renders a blue box of size 95x75 starting at (125, 49).
; PLAN: r0=125(x), r1=49(y), r2=95(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 49
LDI r2, 95
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
