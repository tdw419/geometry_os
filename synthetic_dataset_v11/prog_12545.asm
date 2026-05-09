; DESCRIPTION: Composite: . Then Places a cyan dot at position (253, 115). Then Draws a blue circle centered at (172, 79) with radius 64.
; PLAN: r0=253(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=172(x), r1=79(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (253, 115).
; PLAN: r0=253(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (172, 79) with radius 64.
; PLAN: r0=172(x), r1=79(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 79
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
