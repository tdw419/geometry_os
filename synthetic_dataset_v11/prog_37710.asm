; DESCRIPTION: Composite: . Then Draws a red line from (98, 115) to (85, 220). Then Sets a single orange pixel at (162, 192).
; PLAN: r0=98(x1), r1=115(y1), r2=85(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (98, 115) to (85, 220).
; PLAN: r0=98(x1), r1=115(y1), r2=85(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 115
LDI r2, 85
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (162, 192).
; PLAN: r0=162(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 192
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
