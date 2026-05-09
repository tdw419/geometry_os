; DESCRIPTION: Composite: . Then Draws a white line from (143, 139) to (216, 22). Then Renders a blue disk with center (165, 186) and radius 61.
; PLAN: r0=143(x1), r1=139(y1), r2=216(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=186(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (143, 139) to (216, 22).
; PLAN: r0=143(x1), r1=139(y1), r2=216(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 139
LDI r2, 216
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (165, 186) and radius 61.
; PLAN: r0=165(x), r1=186(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 186
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
