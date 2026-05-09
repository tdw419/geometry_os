; DESCRIPTION: Composite: Sets a single magenta pixel at (423, 240) then Draws a cyan circle centered at (248, 75) with radius 25 then Renders a white line between points (148, 127) and (183, 151).
; PLAN: r0=423(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=75(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x1), r11=127(y1), r12=183(x2), r13=151(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 75
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 127
LDI r12, 183
LDI r13, 151
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
