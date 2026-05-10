; DESCRIPTION: Draws a orange line from (373, 248) to (92, 46).
; PLAN: r0=373(x1), r1=248(y1), r2=92(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 248
LDI r2, 92
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
