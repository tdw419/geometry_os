; DESCRIPTION: Draws a yellow line from (15, 146) to (234, 211).
; PLAN: r0=15(x1), r1=146(y1), r2=234(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 146
LDI r2, 234
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
