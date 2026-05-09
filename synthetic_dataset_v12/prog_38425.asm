; DESCRIPTION: Draws a magenta line from (72, 181) to (103, 134).
; PLAN: r0=72(x1), r1=181(y1), r2=103(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 181
LDI r2, 103
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
