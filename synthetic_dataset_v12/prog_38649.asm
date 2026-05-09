; DESCRIPTION: Places a blue line segment connecting (82, 113) to (124, 204).
; PLAN: r0=82(x1), r1=113(y1), r2=124(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 113
LDI r2, 124
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
