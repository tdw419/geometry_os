; DESCRIPTION: Renders a purple line between points (470, 129) and (462, 239).
; PLAN: r0=470(x1), r1=129(y1), r2=462(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 129
LDI r2, 462
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
