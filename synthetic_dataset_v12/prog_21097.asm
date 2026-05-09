; DESCRIPTION: Draws a black line from (372, 57) to (357, 57).
; PLAN: r0=372(x1), r1=57(y1), r2=357(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 57
LDI r2, 357
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
