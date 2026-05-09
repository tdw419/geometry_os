; DESCRIPTION: Composite: Places a blue circle of radius 64 at center (243, 65) then Draws a red rectangle at (174, 37) with width 96 and height 89 then Places a purple dot at position (225, 234).
; PLAN: r0=243(x), r1=65(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=37(y), r7=96(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=234(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 65
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 37
LDI r7, 96
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 234
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
