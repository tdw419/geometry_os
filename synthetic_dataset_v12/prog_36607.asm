; DESCRIPTION: Draws a magenta line from (220, 35) to (101, 82).
; PLAN: r0=220(x1), r1=35(y1), r2=101(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 35
LDI r2, 101
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
