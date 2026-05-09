; DESCRIPTION: Renders a blue line between points (229, 248) and (168, 18).
; PLAN: r0=229(x1), r1=248(y1), r2=168(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 248
LDI r2, 168
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
