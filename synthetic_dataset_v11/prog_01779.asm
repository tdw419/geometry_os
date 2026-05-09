; DESCRIPTION: Renders a yellow box of size 14x62 starting at (208, 58).
; PLAN: r0=208(x), r1=58(y), r2=14(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 58
LDI r2, 14
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
