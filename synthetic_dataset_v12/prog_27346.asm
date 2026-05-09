; DESCRIPTION: Composite: Renders a yellow line between points (467, 81) and (352, 225) then Draws a white circle centered at (494, 243) with radius 11 then Sets a single green pixel at (237, 240).
; PLAN: r0=467(x1), r1=81(y1), r2=352(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=494(x), r6=243(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=240(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 467
LDI r1, 81
LDI r2, 352
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 243
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 240
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
