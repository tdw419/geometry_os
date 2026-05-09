; DESCRIPTION: Composite: . Then Places a blue dot at position (122, 133). Then Creates a yellow circular shape at (132, 135) with radius 73.
; PLAN: r0=122(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=132(x), r1=135(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (122, 133).
; PLAN: r0=122(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (132, 135) with radius 73.
; PLAN: r0=132(x), r1=135(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 135
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
