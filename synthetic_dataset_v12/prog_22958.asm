; DESCRIPTION: Renders a blue box of size 52x95 starting at (70, 119).
; PLAN: r0=70(x), r1=119(y), r2=52(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 119
LDI r2, 52
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
