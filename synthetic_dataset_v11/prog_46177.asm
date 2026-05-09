; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (133, 30) with radius 16. Then Places a blue dot at position (162, 191).
; PLAN: r0=133(x), r1=30(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=162(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (133, 30) with radius 16.
; PLAN: r0=133(x), r1=30(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 30
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (162, 191).
; PLAN: r0=162(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
