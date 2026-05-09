; DESCRIPTION: Draws a magenta line from (150, 231) to (153, 247).
; PLAN: r0=150(x1), r1=231(y1), r2=153(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 231
LDI r2, 153
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
