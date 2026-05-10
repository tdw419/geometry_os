; DESCRIPTION: Renders a blue line between points (21, 223) and (184, 3).
; PLAN: r0=21(x1), r1=223(y1), r2=184(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 223
LDI r2, 184
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
