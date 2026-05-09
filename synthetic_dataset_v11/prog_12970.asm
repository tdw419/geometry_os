; DESCRIPTION: Composite: . Then Renders a magenta disk with center (184, 91) and radius 50. Then Places a black dot at position (52, 120).
; PLAN: r0=184(x), r1=91(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (184, 91) and radius 50.
; PLAN: r0=184(x), r1=91(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 91
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (52, 120).
; PLAN: r0=52(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
HALT
