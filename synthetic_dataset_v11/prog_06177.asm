; DESCRIPTION: Composite: . Then Places a purple line segment connecting (205, 180) to (1, 34). Then Sets a single white pixel at (217, 225).
; PLAN: r0=205(x1), r1=180(y1), r2=1(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=217(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (205, 180) to (1, 34).
; PLAN: r0=205(x1), r1=180(y1), r2=1(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 180
LDI r2, 1
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (217, 225).
; PLAN: r0=217(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
