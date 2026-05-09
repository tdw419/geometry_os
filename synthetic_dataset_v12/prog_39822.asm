; DESCRIPTION: Draws a magenta line from (77, 104) to (95, 120).
; PLAN: r0=77(x1), r1=104(y1), r2=95(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 104
LDI r2, 95
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
