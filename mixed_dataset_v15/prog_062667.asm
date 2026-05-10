; DESCRIPTION: Renders a blue line between points (61, 1) and (233, 166).
; PLAN: r0=61(x1), r1=1(y1), r2=233(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 1
LDI r2, 233
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
