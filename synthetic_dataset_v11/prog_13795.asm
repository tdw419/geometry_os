; DESCRIPTION: Renders a magenta line between points (95, 200) and (48, 218).
; PLAN: r0=95(x1), r1=200(y1), r2=48(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 200
LDI r2, 48
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
