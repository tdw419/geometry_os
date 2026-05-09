; DESCRIPTION: Draws a magenta line from (163, 96) to (110, 143).
; PLAN: r0=163(x1), r1=96(y1), r2=110(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 96
LDI r2, 110
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
