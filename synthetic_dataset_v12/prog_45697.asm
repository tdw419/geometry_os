; DESCRIPTION: Renders a orange line between points (135, 144) and (288, 236).
; PLAN: r0=135(x1), r1=144(y1), r2=288(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 144
LDI r2, 288
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
