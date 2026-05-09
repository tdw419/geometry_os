; DESCRIPTION: Renders a orange line between points (320, 137) and (236, 79).
; PLAN: r0=320(x1), r1=137(y1), r2=236(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 137
LDI r2, 236
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
