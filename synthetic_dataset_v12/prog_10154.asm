; DESCRIPTION: Composite: Sets a single magenta pixel at (412, 49) then Places a purple circle of radius 31 at center (295, 75) then Renders a magenta line between points (299, 130) and (207, 41).
; PLAN: r0=412(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=75(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x1), r11=130(y1), r12=207(x2), r13=41(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 75
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 130
LDI r12, 207
LDI r13, 41
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
