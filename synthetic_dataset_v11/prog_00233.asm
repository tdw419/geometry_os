; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (79, 100) to (233, 197). Then Sets a single green pixel at (120, 173).
; PLAN: r0=79(x1), r1=100(y1), r2=233(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=120(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (79, 100) to (233, 197).
; PLAN: r0=79(x1), r1=100(y1), r2=233(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 100
LDI r2, 233
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (120, 173).
; PLAN: r0=120(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
