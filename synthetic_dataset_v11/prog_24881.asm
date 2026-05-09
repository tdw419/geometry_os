; DESCRIPTION: Draws a yellow line from (121, 202) to (251, 10).
; PLAN: r0=121(x1), r1=202(y1), r2=251(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 202
LDI r2, 251
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
