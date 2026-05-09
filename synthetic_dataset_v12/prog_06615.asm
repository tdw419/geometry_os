; DESCRIPTION: Renders a white line between points (54, 91) and (55, 137).
; PLAN: r0=54(x1), r1=91(y1), r2=55(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 91
LDI r2, 55
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
