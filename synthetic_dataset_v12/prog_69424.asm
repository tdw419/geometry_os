; DESCRIPTION: Composite: Draws a white rectangle at (95, 200) with width 17 and height 23 then Places a cyan circle of radius 10 at center (389, 19) then Sets a single purple pixel at (292, 157).
; PLAN: r0=95(x), r1=200(y), r2=17(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=19(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=157(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 200
LDI r2, 17
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 19
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 157
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
