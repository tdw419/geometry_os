; DESCRIPTION: Draws a magenta line from (35, 212) to (352, 54).
; PLAN: r0=35(x1), r1=212(y1), r2=352(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 212
LDI r2, 352
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
