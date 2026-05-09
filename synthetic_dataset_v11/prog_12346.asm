; DESCRIPTION: Renders a blue line between points (86, 54) and (208, 32).
; PLAN: r0=86(x1), r1=54(y1), r2=208(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 54
LDI r2, 208
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
