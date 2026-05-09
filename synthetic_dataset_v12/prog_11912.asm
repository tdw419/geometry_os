; DESCRIPTION: Renders a orange line between points (370, 205) and (78, 132).
; PLAN: r0=370(x1), r1=205(y1), r2=78(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 205
LDI r2, 78
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
