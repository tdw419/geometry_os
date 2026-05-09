; DESCRIPTION: Renders a blue line between points (198, 218) and (464, 247).
; PLAN: r0=198(x1), r1=218(y1), r2=464(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 218
LDI r2, 464
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
