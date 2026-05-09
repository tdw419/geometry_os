; DESCRIPTION: Renders a orange line between points (398, 82) and (85, 44).
; PLAN: r0=398(x1), r1=82(y1), r2=85(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 82
LDI r2, 85
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
