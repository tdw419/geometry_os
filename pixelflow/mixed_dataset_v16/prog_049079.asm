; DESCRIPTION: Renders a blue line between points (320, 168) and (470, 118).
; PLAN: r0=320(x1), r1=168(y1), r2=470(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 168
LDI r2, 470
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
