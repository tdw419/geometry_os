; DESCRIPTION: Composite: Renders a orange line between points (298, 11) and (499, 137) then Creates a green circular shape at (92, 220) with radius 35 then Sets a single green pixel at (255, 71).
; PLAN: r0=298(x1), r1=11(y1), r2=499(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=220(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x), r11=71(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 11
LDI r2, 499
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 220
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 71
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
