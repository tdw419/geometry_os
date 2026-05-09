; DESCRIPTION: Renders a blue line between points (53, 78) and (267, 131).
; PLAN: r0=53(x1), r1=78(y1), r2=267(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 78
LDI r2, 267
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
