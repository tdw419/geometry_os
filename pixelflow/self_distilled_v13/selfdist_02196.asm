; DESCRIPTION: Draws a orange line from (171, 115) to (315, 90).
; PLAN: r0=171(x1), r1=115(y1), r2=315(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 115
LDI r2, 315
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
