; DESCRIPTION: Renders a yellow box of size 23x45 starting at (159, 162).
; PLAN: r0=159(x), r1=162(y), r2=23(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 162
LDI r2, 23
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
