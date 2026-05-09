; DESCRIPTION: Renders a yellow line between points (128, 50) and (69, 155).
; PLAN: r0=128(x1), r1=50(y1), r2=69(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 50
LDI r2, 69
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
