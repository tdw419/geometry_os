; DESCRIPTION: Draws a orange line from (229, 206) to (241, 21).
; PLAN: r0=229(x1), r1=206(y1), r2=241(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 206
LDI r2, 241
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
