; DESCRIPTION: Draws a magenta line from (150, 38) to (145, 95).
; PLAN: r0=150(x1), r1=38(y1), r2=145(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 38
LDI r2, 145
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
