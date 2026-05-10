; DESCRIPTION: Composite: Sets a single blue pixel at (349, 157) then Renders a orange disk with center (223, 152) and radius 75 then Draws a magenta line from (190, 24) to (240, 53).
; PLAN: r0=349(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=152(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x1), r11=24(y1), r12=240(x2), r13=53(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 152
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 24
LDI r12, 240
LDI r13, 53
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
