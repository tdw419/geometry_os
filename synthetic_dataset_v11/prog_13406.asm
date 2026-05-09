; DESCRIPTION: Renders a yellow box of size 29x43 starting at (13, 208).
; PLAN: r0=13(x), r1=208(y), r2=29(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 208
LDI r2, 29
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
