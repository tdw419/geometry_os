; DESCRIPTION: Draws a magenta line from (235, 17) to (38, 233).
; PLAN: r0=235(x1), r1=17(y1), r2=38(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 17
LDI r2, 38
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
