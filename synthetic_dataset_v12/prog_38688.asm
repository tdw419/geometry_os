; DESCRIPTION: Composite: Draws a blue line from (226, 11) to (240, 214) then Places a red circle of radius 40 at center (408, 159).
; PLAN: r0=226(x1), r1=11(y1), r2=240(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=159(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 11
LDI r2, 240
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 159
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
