; DESCRIPTION: Composite: . Then Places a green dot at position (229, 2). Then Renders a orange disk with center (78, 141) and radius 55.
; PLAN: r0=229(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=78(x), r1=141(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (229, 2).
; PLAN: r0=229(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (78, 141) and radius 55.
; PLAN: r0=78(x), r1=141(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 141
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
