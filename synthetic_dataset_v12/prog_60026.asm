; DESCRIPTION: Draws a white line from (68, 39) to (357, 237).
; PLAN: r0=68(x1), r1=39(y1), r2=357(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 39
LDI r2, 357
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
