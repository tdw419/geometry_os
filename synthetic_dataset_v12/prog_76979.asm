; DESCRIPTION: Renders a orange line between points (364, 124) and (480, 98).
; PLAN: r0=364(x1), r1=124(y1), r2=480(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 124
LDI r2, 480
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
