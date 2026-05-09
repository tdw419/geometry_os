; DESCRIPTION: Renders a blue box of size 95x75 starting at (4, 12).
; PLAN: r0=4(x), r1=12(y), r2=95(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 12
LDI r2, 95
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
