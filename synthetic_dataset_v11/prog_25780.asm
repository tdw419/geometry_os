; DESCRIPTION: Draws a magenta line from (143, 249) to (139, 75).
; PLAN: r0=143(x1), r1=249(y1), r2=139(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 249
LDI r2, 139
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
