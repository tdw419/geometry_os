; DESCRIPTION: Composite: . Then Renders a blue line between points (75, 60) and (43, 165). Then Places a red circle of radius 35 at center (111, 74).
; PLAN: r0=75(x1), r1=60(y1), r2=43(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=111(x), r1=74(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (75, 60) and (43, 165).
; PLAN: r0=75(x1), r1=60(y1), r2=43(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 60
LDI r2, 43
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 35 at center (111, 74).
; PLAN: r0=111(x), r1=74(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 74
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
