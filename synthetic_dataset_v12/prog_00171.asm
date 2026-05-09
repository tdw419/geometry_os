; DESCRIPTION: Renders a yellow box of size 66x76 starting at (336, 123).
; PLAN: r0=336(x), r1=123(y), r2=66(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 123
LDI r2, 66
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
