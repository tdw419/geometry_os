; DESCRIPTION: Composite: Draws a orange circle centered at (358, 120) with radius 58 then Places a purple line segment connecting (238, 186) to (422, 111) then Places a purple dot at position (393, 40).
; PLAN: r0=358(x), r1=120(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=186(y1), r7=422(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=40(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 120
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 186
LDI r7, 422
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 40
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
