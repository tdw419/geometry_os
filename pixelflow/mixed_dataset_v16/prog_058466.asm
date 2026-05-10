; DESCRIPTION: Renders a orange line between points (504, 31) and (120, 255).
; PLAN: r0=504(x1), r1=31(y1), r2=120(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 31
LDI r2, 120
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
