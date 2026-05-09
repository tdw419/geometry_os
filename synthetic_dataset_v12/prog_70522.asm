; DESCRIPTION: Renders a yellow box of size 13x33 starting at (252, 149).
; PLAN: r0=252(x), r1=149(y), r2=13(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 149
LDI r2, 13
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
