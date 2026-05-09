; DESCRIPTION: Draws a orange line from (373, 9) to (243, 172).
; PLAN: r0=373(x1), r1=9(y1), r2=243(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 9
LDI r2, 243
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
