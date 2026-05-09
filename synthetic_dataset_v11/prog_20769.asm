; DESCRIPTION: Composite: . Then Renders a magenta disk with center (117, 165) and radius 40. Then Places a green dot at position (83, 240).
; PLAN: r0=117(x), r1=165(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=83(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (117, 165) and radius 40.
; PLAN: r0=117(x), r1=165(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 165
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (83, 240).
; PLAN: r0=83(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 240
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
