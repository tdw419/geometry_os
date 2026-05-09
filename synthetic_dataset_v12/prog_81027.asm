; DESCRIPTION: Renders a orange line between points (173, 192) and (261, 55).
; PLAN: r0=173(x1), r1=192(y1), r2=261(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 192
LDI r2, 261
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
