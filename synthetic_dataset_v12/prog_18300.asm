; DESCRIPTION: Draws a white line from (130, 181) to (357, 167).
; PLAN: r0=130(x1), r1=181(y1), r2=357(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 181
LDI r2, 357
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
