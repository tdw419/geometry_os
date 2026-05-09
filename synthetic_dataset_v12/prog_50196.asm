; DESCRIPTION: Renders a orange line between points (446, 205) and (100, 98).
; PLAN: r0=446(x1), r1=205(y1), r2=100(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 205
LDI r2, 100
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
