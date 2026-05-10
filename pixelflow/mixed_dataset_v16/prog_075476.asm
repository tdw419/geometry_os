; DESCRIPTION: Renders a yellow line between points (280, 6) and (424, 90).
; PLAN: r0=280(x1), r1=6(y1), r2=424(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 6
LDI r2, 424
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
