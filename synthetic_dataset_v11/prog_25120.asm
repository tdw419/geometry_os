; DESCRIPTION: Composite: . Then Draws a white line from (250, 94) to (130, 198). Then Renders a purple disk with center (182, 83) and radius 18.
; PLAN: r0=250(x1), r1=94(y1), r2=130(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=83(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (250, 94) to (130, 198).
; PLAN: r0=250(x1), r1=94(y1), r2=130(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 94
LDI r2, 130
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (182, 83) and radius 18.
; PLAN: r0=182(x), r1=83(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 83
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
