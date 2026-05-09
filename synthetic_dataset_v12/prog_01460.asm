; DESCRIPTION: Draws a blue line from (307, 174) to (181, 152).
; PLAN: r0=307(x1), r1=174(y1), r2=181(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 174
LDI r2, 181
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
