; DESCRIPTION: Draws a red line from (345, 103) to (505, 112).
; PLAN: r0=345(x1), r1=103(y1), r2=505(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 103
LDI r2, 505
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
