; DESCRIPTION: Renders a orange line between points (175, 87) and (442, 241).
; PLAN: r0=175(x1), r1=87(y1), r2=442(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 87
LDI r2, 442
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
