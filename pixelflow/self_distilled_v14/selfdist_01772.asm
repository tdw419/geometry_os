; DESCRIPTION: Draws a orange line from (400, 7) to (18, 165).
; PLAN: r0=400(x1), r1=7(y1), r2=18(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 7
LDI r2, 18
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
