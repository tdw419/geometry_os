; DESCRIPTION: Renders a yellow line between points (108, 54) and (175, 82).
; PLAN: r0=108(x1), r1=54(y1), r2=175(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 54
LDI r2, 175
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
