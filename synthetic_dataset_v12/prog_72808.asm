; DESCRIPTION: Draws a orange line from (330, 208) to (417, 153).
; PLAN: r0=330(x1), r1=208(y1), r2=417(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 208
LDI r2, 417
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
