; DESCRIPTION: Composite: . Then Draws a white line from (220, 124) to (37, 210). Then Sets a single yellow pixel at (201, 117).
; PLAN: r0=220(x1), r1=124(y1), r2=37(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (220, 124) to (37, 210).
; PLAN: r0=220(x1), r1=124(y1), r2=37(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 124
LDI r2, 37
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (201, 117).
; PLAN: r0=201(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
