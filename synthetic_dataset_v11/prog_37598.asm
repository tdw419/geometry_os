; DESCRIPTION: Composite: . Then Sets a single purple pixel at (197, 44). Then Renders a orange line between points (10, 39) and (176, 211).
; PLAN: r0=197(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=10(x1), r1=39(y1), r2=176(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (197, 44).
; PLAN: r0=197(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (10, 39) and (176, 211).
; PLAN: r0=10(x1), r1=39(y1), r2=176(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 39
LDI r2, 176
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
