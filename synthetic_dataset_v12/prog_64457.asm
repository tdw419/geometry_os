; DESCRIPTION: Renders a blue line between points (215, 151) and (357, 233).
; PLAN: r0=215(x1), r1=151(y1), r2=357(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 151
LDI r2, 357
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
