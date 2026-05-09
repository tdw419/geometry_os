; DESCRIPTION: Draws a blue line from (246, 47) to (249, 109).
; PLAN: r0=246(x1), r1=47(y1), r2=249(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 47
LDI r2, 249
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
