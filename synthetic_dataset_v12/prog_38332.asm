; DESCRIPTION: Renders a yellow box of size 85x108 starting at (166, 65).
; PLAN: r0=166(x), r1=65(y), r2=85(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 65
LDI r2, 85
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
