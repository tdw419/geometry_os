; DESCRIPTION: Draws a orange line from (358, 146) to (61, 170).
; PLAN: r0=358(x1), r1=146(y1), r2=61(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 146
LDI r2, 61
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
