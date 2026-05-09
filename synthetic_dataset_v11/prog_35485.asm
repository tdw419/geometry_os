; DESCRIPTION: Renders a green box of size 80x52 starting at (118, 55).
; PLAN: r0=118(x), r1=55(y), r2=80(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 55
LDI r2, 80
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
