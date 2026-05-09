; DESCRIPTION: Composite: . Then Places a green dot at position (124, 47). Then Renders a orange disk with center (87, 159) and radius 69.
; PLAN: r0=124(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=159(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (124, 47).
; PLAN: r0=124(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (87, 159) and radius 69.
; PLAN: r0=87(x), r1=159(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 159
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
