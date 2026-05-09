; DESCRIPTION: Composite: Creates a blue rectangular region at (87, 71) spanning 36 by 91 pixels then Sets a single purple pixel at (418, 227) then Renders a white line between points (440, 241) and (456, 196).
; PLAN: r0=87(x), r1=71(y), r2=36(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=227(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=440(x1), r11=241(y1), r12=456(x2), r13=196(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 71
LDI r2, 36
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 227
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 440
LDI r11, 241
LDI r12, 456
LDI r13, 196
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
