; DESCRIPTION: Renders a green line between points (176, 223) and (137, 203).
; PLAN: r0=176(x1), r1=223(y1), r2=137(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 223
LDI r2, 137
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
