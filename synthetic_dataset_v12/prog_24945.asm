; DESCRIPTION: Renders a yellow line between points (196, 120) and (92, 85).
; PLAN: r0=196(x1), r1=120(y1), r2=92(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 120
LDI r2, 92
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
