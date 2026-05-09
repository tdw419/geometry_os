; DESCRIPTION: Draws a magenta line from (308, 8) to (345, 53).
; PLAN: r0=308(x1), r1=8(y1), r2=345(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 8
LDI r2, 345
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
