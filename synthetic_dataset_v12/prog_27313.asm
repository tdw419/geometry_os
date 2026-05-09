; DESCRIPTION: Renders a blue line between points (303, 67) and (106, 204).
; PLAN: r0=303(x1), r1=67(y1), r2=106(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 67
LDI r2, 106
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
