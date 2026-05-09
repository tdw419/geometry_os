; DESCRIPTION: Composite: Draws a yellow circle centered at (306, 163) with radius 53 then Renders a yellow line between points (436, 177) and (176, 248) then Places a magenta dot at position (297, 102).
; PLAN: r0=306(x), r1=163(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=177(y1), r7=176(x2), r8=248(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=102(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 163
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 177
LDI r7, 176
LDI r8, 248
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 102
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
