; DESCRIPTION: Renders a white line between points (207, 60) and (108, 147).
; PLAN: r0=207(x1), r1=60(y1), r2=108(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 60
LDI r2, 108
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
