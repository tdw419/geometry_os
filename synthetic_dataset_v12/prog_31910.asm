; DESCRIPTION: Renders a blue line between points (292, 229) and (18, 57).
; PLAN: r0=292(x1), r1=229(y1), r2=18(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 229
LDI r2, 18
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
