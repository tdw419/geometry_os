; DESCRIPTION: Composite: Draws a blue circle centered at (362, 116) with radius 74 then Draws a red line from (302, 224) to (230, 165) then Sets a single red pixel at (404, 211).
; PLAN: r0=362(x), r1=116(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=224(y1), r7=230(x2), r8=165(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=211(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 116
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 224
LDI r7, 230
LDI r8, 165
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 211
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
