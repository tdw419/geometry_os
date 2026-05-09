; DESCRIPTION: Composite: . Then Draws a blue line from (182, 33) to (125, 58). Then Sets a single cyan pixel at (201, 12).
; PLAN: r0=182(x1), r1=33(y1), r2=125(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (182, 33) to (125, 58).
; PLAN: r0=182(x1), r1=33(y1), r2=125(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 33
LDI r2, 125
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (201, 12).
; PLAN: r0=201(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
