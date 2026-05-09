; DESCRIPTION: Draws a white line from (98, 16) to (451, 142).
; PLAN: r0=98(x1), r1=16(y1), r2=451(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 16
LDI r2, 451
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
