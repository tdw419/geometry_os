; DESCRIPTION: Renders a blue line between points (307, 200) and (214, 124).
; PLAN: r0=307(x1), r1=200(y1), r2=214(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 200
LDI r2, 214
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
