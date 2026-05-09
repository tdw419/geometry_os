; DESCRIPTION: Renders a yellow box of size 45x107 starting at (465, 123).
; PLAN: r0=465(x), r1=123(y), r2=45(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 123
LDI r2, 45
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
