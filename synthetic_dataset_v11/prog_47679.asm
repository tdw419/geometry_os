; DESCRIPTION: Renders a blue line between points (50, 226) and (23, 218).
; PLAN: r0=50(x1), r1=226(y1), r2=23(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 226
LDI r2, 23
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
