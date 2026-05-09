; DESCRIPTION: Renders a blue line between points (50, 59) and (248, 76).
; PLAN: r0=50(x1), r1=59(y1), r2=248(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 59
LDI r2, 248
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
