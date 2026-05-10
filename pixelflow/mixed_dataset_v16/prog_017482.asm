; DESCRIPTION: Draws a magenta line from (47, 114) to (300, 128).
; PLAN: r0=47(x1), r1=114(y1), r2=300(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 114
LDI r2, 300
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
