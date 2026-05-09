; DESCRIPTION: Renders a blue line between points (87, 27) and (55, 102).
; PLAN: r0=87(x1), r1=27(y1), r2=55(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 27
LDI r2, 55
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
