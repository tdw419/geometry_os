; DESCRIPTION: Composite: . Then Renders a orange disk with center (81, 110) and radius 80. Then Places a cyan dot at position (39, 6).
; PLAN: r0=81(x), r1=110(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (81, 110) and radius 80.
; PLAN: r0=81(x), r1=110(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 110
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (39, 6).
; PLAN: r0=39(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
