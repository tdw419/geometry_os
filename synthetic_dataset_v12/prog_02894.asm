; DESCRIPTION: Composite: Sets a single white pixel at (253, 195) then Draws a orange circle centered at (422, 85) with radius 70 then Places a cyan line segment connecting (242, 160) to (441, 118).
; PLAN: r0=253(x), r1=195(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=85(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=160(y1), r12=441(x2), r13=118(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 195
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 85
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 160
LDI r12, 441
LDI r13, 118
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
