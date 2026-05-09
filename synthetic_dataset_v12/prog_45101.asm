; DESCRIPTION: Draws a orange line from (144, 136) to (248, 125).
; PLAN: r0=144(x1), r1=136(y1), r2=248(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 136
LDI r2, 248
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
