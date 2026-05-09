; DESCRIPTION: Composite: . Then Places a cyan dot at position (197, 110). Then Places a blue circle of radius 76 at center (146, 121).
; PLAN: r0=197(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=146(x), r1=121(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (197, 110).
; PLAN: r0=197(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 76 at center (146, 121).
; PLAN: r0=146(x), r1=121(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 121
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
