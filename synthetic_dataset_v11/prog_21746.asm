; DESCRIPTION: Draws a blue line from (248, 228) to (169, 75).
; PLAN: r0=248(x1), r1=228(y1), r2=169(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 228
LDI r2, 169
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
