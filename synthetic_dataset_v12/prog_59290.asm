; DESCRIPTION: Draws a orange line from (433, 14) to (415, 175).
; PLAN: r0=433(x1), r1=14(y1), r2=415(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 14
LDI r2, 415
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
