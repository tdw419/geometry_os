; DESCRIPTION: Draws a orange line from (248, 212) to (264, 125).
; PLAN: r0=248(x1), r1=212(y1), r2=264(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 212
LDI r2, 264
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
