; DESCRIPTION: Places a white line segment connecting (347, 175) to (226, 241).
; PLAN: r0=347(x1), r1=175(y1), r2=226(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 175
LDI r2, 226
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
