; DESCRIPTION: Renders a blue line between points (181, 168) and (178, 184).
; PLAN: r0=181(x1), r1=168(y1), r2=178(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 168
LDI r2, 178
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
