; DESCRIPTION: Composite: . Then Renders a purple disk with center (153, 127) and radius 68. Then Renders a purple line between points (182, 161) and (189, 29).
; PLAN: r0=153(x), r1=127(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x1), r1=161(y1), r2=189(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (153, 127) and radius 68.
; PLAN: r0=153(x), r1=127(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 127
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (182, 161) and (189, 29).
; PLAN: r0=182(x1), r1=161(y1), r2=189(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 161
LDI r2, 189
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
