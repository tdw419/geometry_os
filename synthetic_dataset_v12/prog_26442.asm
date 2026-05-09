; DESCRIPTION: Renders a orange line between points (57, 205) and (46, 109).
; PLAN: r0=57(x1), r1=205(y1), r2=46(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 205
LDI r2, 46
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
