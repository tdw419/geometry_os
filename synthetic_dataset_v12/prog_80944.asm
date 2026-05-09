; DESCRIPTION: Draws a orange line from (400, 64) to (433, 175).
; PLAN: r0=400(x1), r1=64(y1), r2=433(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 64
LDI r2, 433
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
