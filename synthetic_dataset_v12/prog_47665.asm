; DESCRIPTION: Renders a blue box of size 120x110 starting at (106, 52).
; PLAN: r0=106(x), r1=52(y), r2=120(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 52
LDI r2, 120
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
