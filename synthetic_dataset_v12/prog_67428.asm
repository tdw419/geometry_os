; DESCRIPTION: Composite: Sets a single green pixel at (441, 166) then Renders a magenta disk with center (117, 156) and radius 73 then Places a green line segment connecting (334, 160) to (39, 18).
; PLAN: r0=441(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=156(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x1), r11=160(y1), r12=39(x2), r13=18(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 156
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 160
LDI r12, 39
LDI r13, 18
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
