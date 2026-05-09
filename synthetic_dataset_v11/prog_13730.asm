; DESCRIPTION: Draws a magenta line from (197, 148) to (81, 133).
; PLAN: r0=197(x1), r1=148(y1), r2=81(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 148
LDI r2, 81
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
