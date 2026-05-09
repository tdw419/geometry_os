; DESCRIPTION: Renders a blue line between points (206, 113) and (203, 254).
; PLAN: r0=206(x1), r1=113(y1), r2=203(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 113
LDI r2, 203
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
