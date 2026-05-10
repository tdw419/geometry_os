; DESCRIPTION: Draws a magenta line from (111, 95) to (4, 77).
; PLAN: r0=111(x1), r1=95(y1), r2=4(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 95
LDI r2, 4
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
