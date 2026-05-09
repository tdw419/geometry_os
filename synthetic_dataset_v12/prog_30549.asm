; DESCRIPTION: Draws a white line from (433, 33) to (451, 198).
; PLAN: r0=433(x1), r1=33(y1), r2=451(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 33
LDI r2, 451
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
