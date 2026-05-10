; DESCRIPTION: Renders a white line between points (192, 7) and (118, 59).
; PLAN: r0=192(x1), r1=7(y1), r2=118(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 7
LDI r2, 118
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
