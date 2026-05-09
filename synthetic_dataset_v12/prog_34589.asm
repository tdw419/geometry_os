; DESCRIPTION: Draws a magenta line from (403, 52) to (43, 127).
; PLAN: r0=403(x1), r1=52(y1), r2=43(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 52
LDI r2, 43
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
