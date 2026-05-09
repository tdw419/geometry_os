; DESCRIPTION: Renders a orange line between points (504, 244) and (467, 92).
; PLAN: r0=504(x1), r1=244(y1), r2=467(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 244
LDI r2, 467
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
