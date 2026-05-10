; DESCRIPTION: Renders a white line between points (283, 66) and (35, 59).
; PLAN: r0=283(x1), r1=66(y1), r2=35(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 66
LDI r2, 35
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
