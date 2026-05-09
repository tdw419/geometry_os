; DESCRIPTION: Draws a magenta line from (164, 135) to (63, 198).
; PLAN: r0=164(x1), r1=135(y1), r2=63(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 135
LDI r2, 63
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
