; DESCRIPTION: Draws a orange line from (136, 152) to (45, 93).
; PLAN: r0=136(x1), r1=152(y1), r2=45(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 152
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
