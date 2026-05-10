; DESCRIPTION: Draws a white line from (444, 237) to (451, 233).
; PLAN: r0=444(x1), r1=237(y1), r2=451(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 237
LDI r2, 451
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
