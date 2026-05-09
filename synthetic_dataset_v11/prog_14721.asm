; DESCRIPTION: Composite: . Then Places a cyan dot at position (233, 160). Then Places a red circle of radius 54 at center (151, 145).
; PLAN: r0=233(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=151(x), r1=145(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (233, 160).
; PLAN: r0=233(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 54 at center (151, 145).
; PLAN: r0=151(x), r1=145(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 145
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
