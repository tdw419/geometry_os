; DESCRIPTION: Draws a orange line from (76, 90) to (187, 188).
; PLAN: r0=76(x1), r1=90(y1), r2=187(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 90
LDI r2, 187
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
