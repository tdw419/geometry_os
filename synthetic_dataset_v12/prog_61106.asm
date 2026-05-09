; DESCRIPTION: Draws a orange line from (58, 60) to (49, 236).
; PLAN: r0=58(x1), r1=60(y1), r2=49(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 60
LDI r2, 49
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
