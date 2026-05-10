; DESCRIPTION: Renders a blue line between points (144, 17) and (328, 126).
; PLAN: r0=144(x1), r1=17(y1), r2=328(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 17
LDI r2, 328
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
