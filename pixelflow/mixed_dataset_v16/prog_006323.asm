; DESCRIPTION: Composite: Draws a magenta line from (61, 139) to (319, 173) then Draws a red circle centered at (220, 225) with radius 28 then Places a orange dot at position (460, 58).
; PLAN: r0=61(x1), r1=139(y1), r2=319(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=225(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=58(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 139
LDI r2, 319
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 225
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 58
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
