; DESCRIPTION: Composite: . Then Draws a black line from (240, 202) to (210, 190). Then Sets a single green pixel at (24, 63).
; PLAN: r0=240(x1), r1=202(y1), r2=210(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (240, 202) to (210, 190).
; PLAN: r0=240(x1), r1=202(y1), r2=210(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 202
LDI r2, 210
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (24, 63).
; PLAN: r0=24(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
