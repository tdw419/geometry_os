; DESCRIPTION: Draws a magenta line from (305, 145) to (95, 137).
; PLAN: r0=305(x1), r1=145(y1), r2=95(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 145
LDI r2, 95
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
