; DESCRIPTION: Renders a orange line between points (176, 54) and (320, 5).
; PLAN: r0=176(x1), r1=54(y1), r2=320(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 54
LDI r2, 320
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
