; DESCRIPTION: Renders a blue line between points (225, 168) and (210, 218).
; PLAN: r0=225(x1), r1=168(y1), r2=210(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 168
LDI r2, 210
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
