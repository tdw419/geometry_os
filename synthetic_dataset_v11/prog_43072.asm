; DESCRIPTION: Renders a blue line between points (229, 226) and (138, 184).
; PLAN: r0=229(x1), r1=226(y1), r2=138(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 226
LDI r2, 138
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
