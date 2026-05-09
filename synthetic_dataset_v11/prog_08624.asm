; DESCRIPTION: Draws a magenta line from (81, 179) to (185, 16).
; PLAN: r0=81(x1), r1=179(y1), r2=185(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 179
LDI r2, 185
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
