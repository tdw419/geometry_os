; DESCRIPTION: Composite: Draws a green circle centered at (251, 86) with radius 61 then Places a purple line segment connecting (30, 113) to (350, 127) then Places a green dot at position (507, 182).
; PLAN: r0=251(x), r1=86(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=113(y1), r7=350(x2), r8=127(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=182(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 86
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 113
LDI r7, 350
LDI r8, 127
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 182
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
