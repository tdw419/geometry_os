; DESCRIPTION: Draws a magenta line from (53, 48) to (26, 8).
; PLAN: r0=53(x1), r1=48(y1), r2=26(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 48
LDI r2, 26
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
