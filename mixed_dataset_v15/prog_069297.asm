; DESCRIPTION: Draws a orange line from (5, 31) to (198, 37).
; PLAN: r0=5(x1), r1=31(y1), r2=198(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 31
LDI r2, 198
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
