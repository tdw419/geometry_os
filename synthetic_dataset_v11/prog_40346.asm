; DESCRIPTION: Composite: . Then Places a blue line segment connecting (193, 118) to (143, 92). Then Creates a blue circular shape at (55, 212) with radius 29.
; PLAN: r0=193(x1), r1=118(y1), r2=143(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=55(x), r1=212(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (193, 118) to (143, 92).
; PLAN: r0=193(x1), r1=118(y1), r2=143(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 118
LDI r2, 143
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (55, 212) with radius 29.
; PLAN: r0=55(x), r1=212(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 212
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
