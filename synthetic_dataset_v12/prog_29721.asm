; DESCRIPTION: Draws a orange line from (58, 7) to (340, 34).
; PLAN: r0=58(x1), r1=7(y1), r2=340(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 7
LDI r2, 340
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
