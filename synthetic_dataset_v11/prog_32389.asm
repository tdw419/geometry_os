; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (125, 118) with radius 63. Then Places a green dot at position (135, 253).
; PLAN: r0=125(x), r1=118(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (125, 118) with radius 63.
; PLAN: r0=125(x), r1=118(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 118
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (135, 253).
; PLAN: r0=135(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
