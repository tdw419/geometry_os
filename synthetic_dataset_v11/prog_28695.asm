; DESCRIPTION: Renders a yellow box of size 22x103 starting at (91, 9).
; PLAN: r0=91(x), r1=9(y), r2=22(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 9
LDI r2, 22
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
