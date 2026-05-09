; DESCRIPTION: Draws a orange line from (110, 154) to (460, 117).
; PLAN: r0=110(x1), r1=154(y1), r2=460(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 154
LDI r2, 460
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
