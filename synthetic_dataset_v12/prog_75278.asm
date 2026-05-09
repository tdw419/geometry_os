; DESCRIPTION: Draws a magenta line from (328, 252) to (388, 24).
; PLAN: r0=328(x1), r1=252(y1), r2=388(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 252
LDI r2, 388
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
