; DESCRIPTION: Renders a blue line between points (101, 243) and (198, 223).
; PLAN: r0=101(x1), r1=243(y1), r2=198(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 243
LDI r2, 198
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
