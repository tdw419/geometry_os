; DESCRIPTION: Draws a yellow line from (138, 248) to (357, 149).
; PLAN: r0=138(x1), r1=248(y1), r2=357(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 248
LDI r2, 357
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
