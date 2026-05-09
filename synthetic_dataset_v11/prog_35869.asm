; DESCRIPTION: Draws a yellow line from (236, 34) to (248, 164).
; PLAN: r0=236(x1), r1=34(y1), r2=248(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 34
LDI r2, 248
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
