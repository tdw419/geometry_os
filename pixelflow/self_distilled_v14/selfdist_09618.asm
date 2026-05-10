; DESCRIPTION: Draws a blue line from (104, 150) to (246, 79).
; PLAN: r0=104(x1), r1=150(y1), r2=246(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 150
LDI r2, 246
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
