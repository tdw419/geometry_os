; DESCRIPTION: Renders a yellow box of size 76x58 starting at (123, 29).
; PLAN: r0=123(x), r1=29(y), r2=76(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 29
LDI r2, 76
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
