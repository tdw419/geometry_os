; DESCRIPTION: Renders a orange line between points (445, 65) and (8, 56).
; PLAN: r0=445(x1), r1=65(y1), r2=8(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 65
LDI r2, 8
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
