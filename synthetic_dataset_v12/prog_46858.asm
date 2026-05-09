; DESCRIPTION: Draws a white line from (459, 218) to (475, 44).
; PLAN: r0=459(x1), r1=218(y1), r2=475(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 218
LDI r2, 475
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
