; DESCRIPTION: Composite: . Then Renders a cyan disk with center (81, 98) and radius 80. Then Places a cyan dot at position (30, 197).
; PLAN: r0=81(x), r1=98(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=30(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (81, 98) and radius 80.
; PLAN: r0=81(x), r1=98(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 98
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (30, 197).
; PLAN: r0=30(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 197
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
