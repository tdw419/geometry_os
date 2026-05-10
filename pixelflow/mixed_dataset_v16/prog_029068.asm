; DESCRIPTION: Composite: Creates a white rectangular region at (207, 240) spanning 94 by 16 pixels then Sets a single green pixel at (181, 131) then Renders a green line between points (363, 131) and (472, 155).
; PLAN: r0=207(x), r1=240(y), r2=94(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=131(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=363(x1), r11=131(y1), r12=472(x2), r13=155(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 240
LDI r2, 94
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 131
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 363
LDI r11, 131
LDI r12, 472
LDI r13, 155
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
