; DESCRIPTION: Draws a orange line from (251, 109) to (328, 164).
; PLAN: r0=251(x1), r1=109(y1), r2=328(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 109
LDI r2, 328
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
