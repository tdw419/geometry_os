; DESCRIPTION: Renders a blue line between points (113, 28) and (124, 183).
; PLAN: r0=113(x1), r1=28(y1), r2=124(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 28
LDI r2, 124
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
