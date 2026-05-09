; DESCRIPTION: Composite: . Then Renders a green disk with center (113, 60) and radius 36. Then Renders a blue line between points (116, 13) and (232, 168).
; PLAN: r0=113(x), r1=60(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x1), r1=13(y1), r2=232(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (113, 60) and radius 36.
; PLAN: r0=113(x), r1=60(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 60
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (116, 13) and (232, 168).
; PLAN: r0=116(x1), r1=13(y1), r2=232(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 13
LDI r2, 232
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
