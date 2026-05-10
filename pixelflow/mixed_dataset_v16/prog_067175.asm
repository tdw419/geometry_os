; DESCRIPTION: Composite: Sets a single yellow pixel at (116, 82) then Draws a orange circle centered at (140, 136) with radius 54 then Draws a green line from (146, 237) to (255, 173).
; PLAN: r0=116(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=136(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=237(y1), r12=255(x2), r13=173(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 140
LDI r6, 136
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 237
LDI r12, 255
LDI r13, 173
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
