; DESCRIPTION: Renders a yellow line between points (173, 58) and (492, 85).
; PLAN: r0=173(x1), r1=58(y1), r2=492(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 58
LDI r2, 492
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
