; DESCRIPTION: Renders a white line between points (192, 18) and (59, 9).
; PLAN: r0=192(x1), r1=18(y1), r2=59(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 18
LDI r2, 59
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
