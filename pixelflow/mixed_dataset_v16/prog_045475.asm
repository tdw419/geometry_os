; DESCRIPTION: Creates a blue circular shape at (311, 149) with radius 25.
; PLAN: r0=311(x), r1=149(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 149
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
