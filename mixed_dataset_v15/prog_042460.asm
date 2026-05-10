; DESCRIPTION: Draws a orange line from (177, 166) to (66, 82).
; PLAN: r0=177(x1), r1=166(y1), r2=66(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 166
LDI r2, 66
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
