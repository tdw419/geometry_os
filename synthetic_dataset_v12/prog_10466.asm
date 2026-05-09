; DESCRIPTION: Draws a magenta line from (249, 121) to (194, 220).
; PLAN: r0=249(x1), r1=121(y1), r2=194(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 121
LDI r2, 194
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
