; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (179, 52). Then Draws a white line from (201, 219) to (120, 123).
; PLAN: r0=179(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=201(x1), r1=219(y1), r2=120(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (179, 52).
; PLAN: r0=179(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 52
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (201, 219) to (120, 123).
; PLAN: r0=201(x1), r1=219(y1), r2=120(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 219
LDI r2, 120
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
