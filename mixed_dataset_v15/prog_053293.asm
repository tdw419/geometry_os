; DESCRIPTION: Renders a white line between points (147, 174) and (255, 13).
; PLAN: r0=147(x1), r1=174(y1), r2=255(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 174
LDI r2, 255
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
