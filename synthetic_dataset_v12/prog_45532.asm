; DESCRIPTION: Composite: Draws a red line from (460, 101) to (305, 35) then Renders a green disk with center (390, 89) and radius 66.
; PLAN: r0=460(x1), r1=101(y1), r2=305(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=89(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 101
LDI r2, 305
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 89
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
