; DESCRIPTION: Composite: . Then Renders a red line between points (43, 155) and (236, 98). Then Draws a yellow circle centered at (104, 122) with radius 59.
; PLAN: r0=43(x1), r1=155(y1), r2=236(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=122(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (43, 155) and (236, 98).
; PLAN: r0=43(x1), r1=155(y1), r2=236(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 155
LDI r2, 236
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (104, 122) with radius 59.
; PLAN: r0=104(x), r1=122(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 122
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
