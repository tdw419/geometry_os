; DESCRIPTION: Composite: Renders a green line between points (249, 35) and (301, 216) then Draws a blue circle centered at (435, 58) with radius 57.
; PLAN: r0=249(x1), r1=35(y1), r2=301(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=58(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 35
LDI r2, 301
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 58
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
