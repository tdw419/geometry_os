; DESCRIPTION: Renders a yellow box of size 112x23 starting at (311, 60).
; PLAN: r0=311(x), r1=60(y), r2=112(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 60
LDI r2, 112
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
