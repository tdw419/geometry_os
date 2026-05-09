; DESCRIPTION: Renders a yellow line between points (108, 166) and (448, 92).
; PLAN: r0=108(x1), r1=166(y1), r2=448(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 166
LDI r2, 448
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
