; DESCRIPTION: Places a blue line segment connecting (274, 165) to (159, 171).
; PLAN: r0=274(x1), r1=165(y1), r2=159(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 165
LDI r2, 159
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
