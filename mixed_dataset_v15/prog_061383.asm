; DESCRIPTION: Renders a yellow box of size 69x93 starting at (65, 137).
; PLAN: r0=65(x), r1=137(y), r2=69(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 137
LDI r2, 69
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
