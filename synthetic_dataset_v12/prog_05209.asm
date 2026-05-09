; DESCRIPTION: Renders a green line between points (87, 208) and (203, 55).
; PLAN: r0=87(x1), r1=208(y1), r2=203(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 208
LDI r2, 203
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
