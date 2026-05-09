; DESCRIPTION: Renders a blue line between points (9, 33) and (111, 45).
; PLAN: r0=9(x1), r1=33(y1), r2=111(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 33
LDI r2, 111
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
