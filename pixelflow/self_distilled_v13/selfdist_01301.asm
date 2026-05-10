; DESCRIPTION: Draws a yellow line from (176, 141) to (110, 31).
; PLAN: r0=176(x1), r1=141(y1), r2=110(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 141
LDI r2, 110
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
