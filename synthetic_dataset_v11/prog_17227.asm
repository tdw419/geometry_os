; DESCRIPTION: Draws a magenta line from (135, 10) to (146, 254).
; PLAN: r0=135(x1), r1=10(y1), r2=146(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 10
LDI r2, 146
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
