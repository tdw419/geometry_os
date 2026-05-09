; DESCRIPTION: Composite: . Then Renders a magenta disk with center (175, 153) and radius 73. Then Places a red line segment connecting (17, 213) to (71, 168).
; PLAN: r0=175(x), r1=153(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=17(x1), r1=213(y1), r2=71(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (175, 153) and radius 73.
; PLAN: r0=175(x), r1=153(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 153
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (17, 213) to (71, 168).
; PLAN: r0=17(x1), r1=213(y1), r2=71(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 213
LDI r2, 71
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
