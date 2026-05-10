; DESCRIPTION: Composite: Draws a green line from (494, 85) to (369, 83) then Renders a yellow disk with center (286, 162) and radius 72.
; PLAN: r0=494(x1), r1=85(y1), r2=369(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=162(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 85
LDI r2, 369
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 162
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
