; DESCRIPTION: Renders a yellow line between points (395, 223) and (87, 67).
; PLAN: r0=395(x1), r1=223(y1), r2=87(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 223
LDI r2, 87
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
