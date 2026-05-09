; DESCRIPTION: Draws a white line from (15, 170) to (171, 133).
; PLAN: r0=15(x1), r1=170(y1), r2=171(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 170
LDI r2, 171
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
