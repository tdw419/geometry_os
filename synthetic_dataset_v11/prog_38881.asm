; DESCRIPTION: Composite: . Then Renders a black disk with center (150, 171) and radius 56. Then Places a green dot at position (121, 66).
; PLAN: r0=150(x), r1=171(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (150, 171) and radius 56.
; PLAN: r0=150(x), r1=171(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 171
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (121, 66).
; PLAN: r0=121(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
