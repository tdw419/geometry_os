; DESCRIPTION: Renders a yellow box of size 35x103 starting at (191, 22).
; PLAN: r0=191(x), r1=22(y), r2=35(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 22
LDI r2, 35
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
