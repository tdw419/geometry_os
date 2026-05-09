; DESCRIPTION: Composite: Places a blue circle of radius 39 at center (316, 102) then Renders a cyan line between points (232, 197) and (165, 183) then Places a black dot at position (298, 218).
; PLAN: r0=316(x), r1=102(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=197(y1), r7=165(x2), r8=183(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=218(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 102
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 197
LDI r7, 165
LDI r8, 183
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 218
LDI r12, 0x000000
PSET r10, r11, r12
HALT
