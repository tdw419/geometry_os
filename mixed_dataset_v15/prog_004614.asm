; DESCRIPTION: Draws a cyan line from (339, 253) to (357, 110).
; PLAN: r0=339(x1), r1=253(y1), r2=357(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 253
LDI r2, 357
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
