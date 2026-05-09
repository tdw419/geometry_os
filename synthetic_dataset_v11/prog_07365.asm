; DESCRIPTION: Composite: . Then Sets a single white pixel at (225, 222). Then Draws a white line from (229, 133) to (247, 33).
; PLAN: r0=225(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=229(x1), r1=133(y1), r2=247(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (225, 222).
; PLAN: r0=225(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 222
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (229, 133) to (247, 33).
; PLAN: r0=229(x1), r1=133(y1), r2=247(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 133
LDI r2, 247
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
