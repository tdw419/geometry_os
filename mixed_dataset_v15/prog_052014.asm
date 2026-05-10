; DESCRIPTION: Draws a magenta line from (499, 198) to (328, 146).
; PLAN: r0=499(x1), r1=198(y1), r2=328(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 198
LDI r2, 328
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
