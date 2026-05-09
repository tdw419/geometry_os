; DESCRIPTION: Draws a cyan line from (335, 110) to (312, 122).
; PLAN: r0=335(x1), r1=110(y1), r2=312(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 110
LDI r2, 312
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
