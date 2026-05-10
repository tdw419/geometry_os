; DESCRIPTION: Composite: Draws a cyan rectangle at (215, 199) with width 61 and height 48 then Sets a single purple pixel at (468, 165) then Places a red circle of radius 25 at center (134, 192).
; PLAN: r0=215(x), r1=199(y), r2=61(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=165(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=192(y), r12=25(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 199
LDI r2, 61
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 165
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 192
LDI r12, 25
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
