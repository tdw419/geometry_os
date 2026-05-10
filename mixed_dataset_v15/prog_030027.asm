; DESCRIPTION: Composite: Draws a red rectangle at (7, 80) with width 46 and height 57 then Sets a single magenta pixel at (342, 27) then Places a yellow circle of radius 65 at center (309, 145).
; PLAN: r0=7(x), r1=80(y), r2=46(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=27(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=145(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 80
LDI r2, 46
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 27
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 309
LDI r11, 145
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
