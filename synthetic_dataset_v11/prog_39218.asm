; DESCRIPTION: Draws a yellow line from (114, 44) to (75, 217).
; PLAN: r0=114(x1), r1=44(y1), r2=75(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 44
LDI r2, 75
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
