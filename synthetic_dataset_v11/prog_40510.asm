; DESCRIPTION: Composite: . Then Creates a green circular shape at (148, 63) with radius 48. Then Places a cyan dot at position (211, 150).
; PLAN: r0=148(x), r1=63(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (148, 63) with radius 48.
; PLAN: r0=148(x), r1=63(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 63
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (211, 150).
; PLAN: r0=211(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
