; DESCRIPTION: Renders a purple line between points (386, 148) and (300, 131).
; PLAN: r0=386(x1), r1=148(y1), r2=300(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 148
LDI r2, 300
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
