; DESCRIPTION: Composite: . Then Draws a red line from (255, 184) to (113, 39). Then Renders a purple disk with center (54, 175) and radius 18.
; PLAN: r0=255(x1), r1=184(y1), r2=113(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=175(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (255, 184) to (113, 39).
; PLAN: r0=255(x1), r1=184(y1), r2=113(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 184
LDI r2, 113
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (54, 175) and radius 18.
; PLAN: r0=54(x), r1=175(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 175
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
