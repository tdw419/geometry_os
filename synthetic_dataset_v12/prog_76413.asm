; DESCRIPTION: Renders a yellow box of size 100x45 starting at (166, 76).
; PLAN: r0=166(x), r1=76(y), r2=100(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 76
LDI r2, 100
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
