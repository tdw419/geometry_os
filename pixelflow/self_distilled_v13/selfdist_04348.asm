; DESCRIPTION: Draws a magenta line from (258, 172) to (54, 198).
; PLAN: r0=258(x1), r1=172(y1), r2=54(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 172
LDI r2, 54
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
