; DESCRIPTION: Draws a orange line from (7, 154) to (431, 221).
; PLAN: r0=7(x1), r1=154(y1), r2=431(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 154
LDI r2, 431
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
