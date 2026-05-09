; DESCRIPTION: Renders a yellow box of size 118x63 starting at (131, 149).
; PLAN: r0=131(x), r1=149(y), r2=118(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 149
LDI r2, 118
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
