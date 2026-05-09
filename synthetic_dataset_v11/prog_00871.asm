; DESCRIPTION: Draws a purple line from (106, 228) to (166, 194).
; PLAN: r0=106(x1), r1=228(y1), r2=166(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 228
LDI r2, 166
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
