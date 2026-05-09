; DESCRIPTION: Composite: Places a red 55x91 rectangle at position (160, 118) then Sets a single blue pixel at (507, 157) then Renders a white line between points (333, 87) and (373, 49).
; PLAN: r0=160(x), r1=118(y), r2=55(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=333(x1), r11=87(y1), r12=373(x2), r13=49(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 118
LDI r2, 55
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 333
LDI r11, 87
LDI r12, 373
LDI r13, 49
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
