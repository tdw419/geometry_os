; DESCRIPTION: Renders a blue line between points (291, 62) and (474, 37).
; PLAN: r0=291(x1), r1=62(y1), r2=474(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 62
LDI r2, 474
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
