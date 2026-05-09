; DESCRIPTION: Composite: Sets a single white pixel at (328, 106) then Renders a black line between points (241, 221) and (215, 147) then Creates a blue rectangular region at (27, 87) spanning 106 by 99 pixels.
; PLAN: r0=328(x), r1=106(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x1), r6=221(y1), r7=215(x2), r8=147(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=87(y), r12=106(width), r13=99(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 106
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 221
LDI r7, 215
LDI r8, 147
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 87
LDI r12, 106
LDI r13, 99
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
