; DESCRIPTION: Draws a white line from (233, 219) to (165, 145).
; PLAN: r0=233(x1), r1=219(y1), r2=165(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 219
LDI r2, 165
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
