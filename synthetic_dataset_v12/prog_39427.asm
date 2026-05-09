; DESCRIPTION: Renders a blue line between points (67, 219) and (317, 50).
; PLAN: r0=67(x1), r1=219(y1), r2=317(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 219
LDI r2, 317
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
