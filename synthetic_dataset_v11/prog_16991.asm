; DESCRIPTION: Composite: . Then Draws a purple circle centered at (59, 203) with radius 49. Then Renders a purple line between points (249, 54) and (192, 1).
; PLAN: r0=59(x), r1=203(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=249(x1), r1=54(y1), r2=192(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (59, 203) with radius 49.
; PLAN: r0=59(x), r1=203(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 203
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (249, 54) and (192, 1).
; PLAN: r0=249(x1), r1=54(y1), r2=192(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 54
LDI r2, 192
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
