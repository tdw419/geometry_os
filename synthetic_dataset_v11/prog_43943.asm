; DESCRIPTION: Draws a orange line from (176, 208) to (251, 179).
; PLAN: r0=176(x1), r1=208(y1), r2=251(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 208
LDI r2, 251
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
