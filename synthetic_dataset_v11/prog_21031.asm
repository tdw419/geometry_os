; DESCRIPTION: Draws a white line from (125, 65) to (129, 31).
; PLAN: r0=125(x1), r1=65(y1), r2=129(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 65
LDI r2, 129
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
