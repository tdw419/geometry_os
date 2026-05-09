; DESCRIPTION: Draws a magenta line from (108, 198) to (146, 156).
; PLAN: r0=108(x1), r1=198(y1), r2=146(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 198
LDI r2, 146
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
