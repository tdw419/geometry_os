; DESCRIPTION: Renders a blue line between points (1, 62) and (167, 193).
; PLAN: r0=1(x1), r1=62(y1), r2=167(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 62
LDI r2, 167
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
