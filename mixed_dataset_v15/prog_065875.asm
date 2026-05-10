; DESCRIPTION: Draws a orange line from (233, 79) to (305, 20).
; PLAN: r0=233(x1), r1=79(y1), r2=305(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 79
LDI r2, 305
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
