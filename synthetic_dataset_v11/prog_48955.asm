; DESCRIPTION: Renders a red line between points (191, 59) and (32, 110).
; PLAN: r0=191(x1), r1=59(y1), r2=32(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 59
LDI r2, 32
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
