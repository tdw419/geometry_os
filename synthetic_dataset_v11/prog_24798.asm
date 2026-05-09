; DESCRIPTION: Composite: . Then Sets a single white pixel at (206, 44). Then Places a orange line segment connecting (43, 142) to (226, 175).
; PLAN: r0=206(x), r1=44(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=43(x1), r1=142(y1), r2=226(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (206, 44).
; PLAN: r0=206(x), r1=44(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 44
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (43, 142) to (226, 175).
; PLAN: r0=43(x1), r1=142(y1), r2=226(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 142
LDI r2, 226
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
