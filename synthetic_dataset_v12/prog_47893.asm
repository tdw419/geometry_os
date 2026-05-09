; DESCRIPTION: Renders a blue line between points (274, 103) and (460, 170).
; PLAN: r0=274(x1), r1=103(y1), r2=460(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 103
LDI r2, 460
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
