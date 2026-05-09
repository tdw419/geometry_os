; DESCRIPTION: Composite: . Then Renders a orange disk with center (111, 212) and radius 21. Then Places a green dot at position (148, 233).
; PLAN: r0=111(x), r1=212(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=148(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (111, 212) and radius 21.
; PLAN: r0=111(x), r1=212(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 212
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (148, 233).
; PLAN: r0=148(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
