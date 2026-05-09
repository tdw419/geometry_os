; DESCRIPTION: Draws a orange line from (150, 146) to (104, 157).
; PLAN: r0=150(x1), r1=146(y1), r2=104(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 146
LDI r2, 104
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
