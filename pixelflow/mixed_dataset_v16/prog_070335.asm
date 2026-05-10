; DESCRIPTION: Renders a yellow line between points (464, 49) and (249, 59).
; PLAN: r0=464(x1), r1=49(y1), r2=249(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 49
LDI r2, 249
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
