; DESCRIPTION: Renders a orange line between points (175, 163) and (173, 255).
; PLAN: r0=175(x1), r1=163(y1), r2=173(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 163
LDI r2, 173
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
