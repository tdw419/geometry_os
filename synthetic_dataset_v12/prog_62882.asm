; DESCRIPTION: Draws a white line from (357, 225) to (84, 33).
; PLAN: r0=357(x1), r1=225(y1), r2=84(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 225
LDI r2, 84
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
