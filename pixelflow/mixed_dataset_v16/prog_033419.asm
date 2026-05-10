; DESCRIPTION: Draws a magenta line from (63, 143) to (200, 146).
; PLAN: r0=63(x1), r1=143(y1), r2=200(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 143
LDI r2, 200
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
