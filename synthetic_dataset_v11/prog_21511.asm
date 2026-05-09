; DESCRIPTION: Renders a orange line between points (48, 54) and (92, 2).
; PLAN: r0=48(x1), r1=54(y1), r2=92(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 54
LDI r2, 92
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
