; DESCRIPTION: Renders a blue box of size 52x66 starting at (184, 162).
; PLAN: r0=184(x), r1=162(y), r2=52(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 162
LDI r2, 52
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
