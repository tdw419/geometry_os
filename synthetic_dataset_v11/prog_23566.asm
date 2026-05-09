; DESCRIPTION: Composite: . Then Draws a red circle centered at (222, 148) with radius 26. Then Renders a black line between points (255, 41) and (4, 244).
; PLAN: r0=222(x), r1=148(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=255(x1), r1=41(y1), r2=4(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (222, 148) with radius 26.
; PLAN: r0=222(x), r1=148(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 148
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (255, 41) and (4, 244).
; PLAN: r0=255(x1), r1=41(y1), r2=4(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 41
LDI r2, 4
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
