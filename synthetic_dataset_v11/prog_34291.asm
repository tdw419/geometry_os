; DESCRIPTION: Renders a green box of size 15x101 starting at (202, 123).
; PLAN: r0=202(x), r1=123(y), r2=15(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 123
LDI r2, 15
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
