; DESCRIPTION: Composite: . Then Places a yellow circle of radius 80 at center (85, 108). Then Places a yellow dot at position (81, 56).
; PLAN: r0=85(x), r1=108(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=81(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 80 at center (85, 108).
; PLAN: r0=85(x), r1=108(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 108
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (81, 56).
; PLAN: r0=81(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
