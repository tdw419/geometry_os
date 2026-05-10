; DESCRIPTION: Renders a white line between points (13, 137) and (87, 222).
; PLAN: r0=13(x1), r1=137(y1), r2=87(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 137
LDI r2, 87
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
