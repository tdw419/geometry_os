; DESCRIPTION: Draws a orange line from (343, 8) to (410, 224).
; PLAN: r0=343(x1), r1=8(y1), r2=410(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 8
LDI r2, 410
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
