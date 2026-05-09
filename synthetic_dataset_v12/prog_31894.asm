; DESCRIPTION: Draws a magenta line from (72, 73) to (287, 152).
; PLAN: r0=72(x1), r1=73(y1), r2=287(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 73
LDI r2, 287
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
