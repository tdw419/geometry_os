; DESCRIPTION: Renders a white line between points (470, 2) and (282, 62).
; PLAN: r0=470(x1), r1=2(y1), r2=282(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 2
LDI r2, 282
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
