; DESCRIPTION: Draws a magenta line from (222, 147) to (352, 95).
; PLAN: r0=222(x1), r1=147(y1), r2=352(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 147
LDI r2, 352
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
