; DESCRIPTION: Composite: . Then Places a red line segment connecting (123, 221) to (251, 57). Then Renders a blue disk with center (114, 150) and radius 38.
; PLAN: r0=123(x1), r1=221(y1), r2=251(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=150(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (123, 221) to (251, 57).
; PLAN: r0=123(x1), r1=221(y1), r2=251(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 221
LDI r2, 251
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (114, 150) and radius 38.
; PLAN: r0=114(x), r1=150(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 150
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
