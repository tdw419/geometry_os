; DESCRIPTION: Composite: Sets a single red pixel at (180, 11) then Renders a blue line between points (310, 6) and (53, 58) then Creates a blue circular shape at (256, 135) with radius 58.
; PLAN: r0=180(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=6(y1), r7=53(x2), r8=58(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=135(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 6
LDI r7, 53
LDI r8, 58
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 135
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
