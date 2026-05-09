; DESCRIPTION: Draws a white line from (80, 248) to (278, 234).
; PLAN: r0=80(x1), r1=248(y1), r2=278(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 248
LDI r2, 278
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
