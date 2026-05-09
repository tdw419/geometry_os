; DESCRIPTION: Composite: . Then Places a red dot at position (73, 240). Then Renders a orange disk with center (92, 117) and radius 50.
; PLAN: r0=73(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=117(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (73, 240).
; PLAN: r0=73(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (92, 117) and radius 50.
; PLAN: r0=92(x), r1=117(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 117
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
