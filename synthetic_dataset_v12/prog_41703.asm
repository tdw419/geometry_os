; DESCRIPTION: Renders a green box of size 55x14 starting at (162, 100).
; PLAN: r0=162(x), r1=100(y), r2=55(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 100
LDI r2, 55
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
