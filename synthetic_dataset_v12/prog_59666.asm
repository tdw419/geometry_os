; DESCRIPTION: Draws a white line from (31, 248) to (431, 20).
; PLAN: r0=31(x1), r1=248(y1), r2=431(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 248
LDI r2, 431
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
