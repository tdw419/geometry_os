; DESCRIPTION: Composite: . Then Places a red line segment connecting (126, 137) to (123, 148). Then Sets a single cyan pixel at (238, 17).
; PLAN: r0=126(x1), r1=137(y1), r2=123(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=238(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (126, 137) to (123, 148).
; PLAN: r0=126(x1), r1=137(y1), r2=123(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 137
LDI r2, 123
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (238, 17).
; PLAN: r0=238(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 17
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
