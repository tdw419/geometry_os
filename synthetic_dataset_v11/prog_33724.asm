; DESCRIPTION: Renders a green box of size 58x117 starting at (0, 123).
; PLAN: r0=0(x), r1=123(y), r2=58(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 123
LDI r2, 58
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
