; DESCRIPTION: Draws a magenta line from (432, 213) to (328, 55).
; PLAN: r0=432(x1), r1=213(y1), r2=328(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 213
LDI r2, 328
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
