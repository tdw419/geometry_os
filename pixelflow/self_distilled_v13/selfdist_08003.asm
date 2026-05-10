; DESCRIPTION: Draws a orange line from (255, 80) to (342, 77).
; PLAN: r0=255(x1), r1=80(y1), r2=342(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 80
LDI r2, 342
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
