; DESCRIPTION: Draws a orange line from (340, 50) to (290, 75).
; PLAN: r0=340(x1), r1=50(y1), r2=290(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 50
LDI r2, 290
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
