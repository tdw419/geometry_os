; DESCRIPTION: Renders a yellow box of size 108x34 starting at (258, 89).
; PLAN: r0=258(x), r1=89(y), r2=108(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 89
LDI r2, 108
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
