; DESCRIPTION: Composite: . Then Renders a white line between points (139, 20) and (123, 194). Then Places a blue circle of radius 16 at center (145, 132).
; PLAN: r0=139(x1), r1=20(y1), r2=123(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=145(x), r1=132(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (139, 20) and (123, 194).
; PLAN: r0=139(x1), r1=20(y1), r2=123(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 20
LDI r2, 123
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 16 at center (145, 132).
; PLAN: r0=145(x), r1=132(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 132
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
