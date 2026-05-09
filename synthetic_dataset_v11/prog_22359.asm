; DESCRIPTION: Renders a orange line between points (135, 220) and (116, 57).
; PLAN: r0=135(x1), r1=220(y1), r2=116(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 220
LDI r2, 116
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
