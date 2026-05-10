; DESCRIPTION: Renders a blue line between points (508, 86) and (474, 239).
; PLAN: r0=508(x1), r1=86(y1), r2=474(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 86
LDI r2, 474
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
