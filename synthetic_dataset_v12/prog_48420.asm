; DESCRIPTION: Composite: Sets a single purple pixel at (152, 92) then Places a cyan circle of radius 53 at center (273, 155) then Renders a cyan line between points (166, 248) and (141, 143).
; PLAN: r0=152(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=155(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x1), r11=248(y1), r12=141(x2), r13=143(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 155
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 248
LDI r12, 141
LDI r13, 143
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
