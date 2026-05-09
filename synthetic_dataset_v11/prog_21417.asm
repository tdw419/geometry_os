; DESCRIPTION: Renders a blue line between points (211, 225) and (126, 18).
; PLAN: r0=211(x1), r1=225(y1), r2=126(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 225
LDI r2, 126
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
