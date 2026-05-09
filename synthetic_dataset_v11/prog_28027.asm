; DESCRIPTION: Composite: . Then Places a yellow dot at position (62, 133). Then Places a red circle of radius 61 at center (170, 119).
; PLAN: r0=62(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=170(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (62, 133).
; PLAN: r0=62(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 61 at center (170, 119).
; PLAN: r0=170(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 119
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
