; DESCRIPTION: Renders a white line between points (407, 169) and (320, 37).
; PLAN: r0=407(x1), r1=169(y1), r2=320(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 169
LDI r2, 320
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
