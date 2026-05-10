; DESCRIPTION: Draws a orange line from (27, 217) to (130, 16).
; PLAN: r0=27(x1), r1=217(y1), r2=130(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 217
LDI r2, 130
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
