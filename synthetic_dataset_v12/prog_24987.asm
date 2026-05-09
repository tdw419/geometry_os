; DESCRIPTION: Draws a yellow line from (2, 79) to (275, 158).
; PLAN: r0=2(x1), r1=79(y1), r2=275(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 79
LDI r2, 275
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
