; DESCRIPTION: Draws a orange line from (144, 124) to (210, 11).
; PLAN: r0=144(x1), r1=124(y1), r2=210(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 124
LDI r2, 210
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
