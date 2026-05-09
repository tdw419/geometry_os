; DESCRIPTION: Composite: . Then Places a white dot at position (225, 211). Then Places a orange line segment connecting (172, 162) to (218, 240).
; PLAN: r0=225(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=172(x1), r1=162(y1), r2=218(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (225, 211).
; PLAN: r0=225(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 211
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (172, 162) to (218, 240).
; PLAN: r0=172(x1), r1=162(y1), r2=218(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 162
LDI r2, 218
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
