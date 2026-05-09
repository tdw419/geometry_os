; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (15, 225) with radius 15. Then Renders a red line between points (58, 119) and (59, 119).
; PLAN: r0=15(x), r1=225(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=58(x1), r1=119(y1), r2=59(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (15, 225) with radius 15.
; PLAN: r0=15(x), r1=225(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 225
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (58, 119) and (59, 119).
; PLAN: r0=58(x1), r1=119(y1), r2=59(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 119
LDI r2, 59
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
