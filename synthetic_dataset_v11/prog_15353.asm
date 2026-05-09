; DESCRIPTION: Draws a orange line from (174, 223) to (171, 104).
; PLAN: r0=174(x1), r1=223(y1), r2=171(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 223
LDI r2, 171
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
