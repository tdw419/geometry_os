; DESCRIPTION: Composite: Draws a green rectangle at (66, 172) with width 14 and height 47 then Places a yellow circle of radius 73 at center (127, 160) then Sets a single cyan pixel at (460, 241).
; PLAN: r0=66(x), r1=172(y), r2=14(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=160(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=241(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 172
LDI r2, 14
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 160
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 241
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
