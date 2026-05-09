; DESCRIPTION: Composite: . Then Places a green dot at position (9, 76). Then Places a green circle of radius 60 at center (81, 60).
; PLAN: r0=9(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=60(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (9, 76).
; PLAN: r0=9(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 60 at center (81, 60).
; PLAN: r0=81(x), r1=60(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 60
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
