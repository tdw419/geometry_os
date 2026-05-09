; DESCRIPTION: Composite: . Then Renders a black disk with center (183, 120) and radius 46. Then Places a magenta dot at position (149, 133).
; PLAN: r0=183(x), r1=120(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (183, 120) and radius 46.
; PLAN: r0=183(x), r1=120(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 120
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (149, 133).
; PLAN: r0=149(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
