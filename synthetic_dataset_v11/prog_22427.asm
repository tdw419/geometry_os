; DESCRIPTION: Draws a orange line from (30, 20) to (98, 109).
; PLAN: r0=30(x1), r1=20(y1), r2=98(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 20
LDI r2, 98
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
