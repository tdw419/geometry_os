; DESCRIPTION: Draws a orange line from (47, 21) to (202, 96).
; PLAN: r0=47(x1), r1=21(y1), r2=202(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 21
LDI r2, 202
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
