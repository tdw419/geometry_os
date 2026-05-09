; DESCRIPTION: Composite: Draws a red circle centered at (370, 173) with radius 60 then Renders a red line between points (181, 151) and (402, 177) then Sets a single green pixel at (242, 230).
; PLAN: r0=370(x), r1=173(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=151(y1), r7=402(x2), r8=177(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=230(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 173
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 151
LDI r7, 402
LDI r8, 177
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 230
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
