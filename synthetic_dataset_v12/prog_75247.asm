; DESCRIPTION: Draws a orange line from (130, 209) to (186, 205).
; PLAN: r0=130(x1), r1=209(y1), r2=186(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 209
LDI r2, 186
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
