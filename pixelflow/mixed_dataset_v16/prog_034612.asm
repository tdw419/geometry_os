; DESCRIPTION: Renders a orange line between points (108, 36) and (120, 196).
; PLAN: r0=108(x1), r1=36(y1), r2=120(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 36
LDI r2, 120
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
