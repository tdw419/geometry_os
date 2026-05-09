; DESCRIPTION: Renders a yellow line between points (416, 124) and (371, 77).
; PLAN: r0=416(x1), r1=124(y1), r2=371(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 124
LDI r2, 371
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
