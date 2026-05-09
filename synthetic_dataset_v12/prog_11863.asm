; DESCRIPTION: Composite: Places a cyan dot at position (175, 141) then Places a white circle of radius 53 at center (209, 63) then Renders a cyan line between points (147, 218) and (304, 143).
; PLAN: r0=175(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=63(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x1), r11=218(y1), r12=304(x2), r13=143(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 63
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 218
LDI r12, 304
LDI r13, 143
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
