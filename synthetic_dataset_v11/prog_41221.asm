; DESCRIPTION: Draws a magenta line from (145, 221) to (35, 58).
; PLAN: r0=145(x1), r1=221(y1), r2=35(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 221
LDI r2, 35
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
