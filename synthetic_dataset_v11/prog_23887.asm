; DESCRIPTION: Draws a orange line from (136, 79) to (202, 50).
; PLAN: r0=136(x1), r1=79(y1), r2=202(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 79
LDI r2, 202
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
