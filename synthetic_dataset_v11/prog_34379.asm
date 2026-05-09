; DESCRIPTION: Composite: . Then Sets a single orange pixel at (248, 204). Then Draws a white line from (194, 109) to (254, 177).
; PLAN: r0=248(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=194(x1), r1=109(y1), r2=254(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (248, 204).
; PLAN: r0=248(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (194, 109) to (254, 177).
; PLAN: r0=194(x1), r1=109(y1), r2=254(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 109
LDI r2, 254
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
