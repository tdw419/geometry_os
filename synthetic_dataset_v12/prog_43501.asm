; DESCRIPTION: Composite: Draws a blue rectangle at (80, 151) with width 96 and height 52 then Sets a single purple pixel at (232, 138) then Places a cyan circle of radius 38 at center (48, 72).
; PLAN: r0=80(x), r1=151(y), r2=96(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=138(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=48(x), r11=72(y), r12=38(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 151
LDI r2, 96
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 138
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 48
LDI r11, 72
LDI r12, 38
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
