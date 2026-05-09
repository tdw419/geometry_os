; DESCRIPTION: Composite: Renders a white line between points (249, 200) and (253, 57) then Sets a single blue pixel at (37, 162) then Places a black 58x91 rectangle at position (403, 68).
; PLAN: r0=249(x1), r1=200(y1), r2=253(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=162(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=68(y), r12=58(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 200
LDI r2, 253
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 162
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 403
LDI r11, 68
LDI r12, 58
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
