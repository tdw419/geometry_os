; DESCRIPTION: Draws a magenta line from (14, 168) to (110, 254).
; PLAN: r0=14(x1), r1=168(y1), r2=110(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 168
LDI r2, 110
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
