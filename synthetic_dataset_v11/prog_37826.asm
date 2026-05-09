; DESCRIPTION: Draws a orange line from (116, 140) to (38, 171).
; PLAN: r0=116(x1), r1=140(y1), r2=38(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 140
LDI r2, 38
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
