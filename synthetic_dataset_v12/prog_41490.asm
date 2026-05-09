; DESCRIPTION: Renders a blue line between points (405, 126) and (287, 59).
; PLAN: r0=405(x1), r1=126(y1), r2=287(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 126
LDI r2, 287
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
