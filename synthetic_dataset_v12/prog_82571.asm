; DESCRIPTION: Draws a yellow line from (300, 233) to (141, 44).
; PLAN: r0=300(x1), r1=233(y1), r2=141(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 233
LDI r2, 141
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
