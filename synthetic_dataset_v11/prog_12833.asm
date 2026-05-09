; DESCRIPTION: Draws a yellow line from (225, 55) to (181, 187).
; PLAN: r0=225(x1), r1=55(y1), r2=181(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 55
LDI r2, 181
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
