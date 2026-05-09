; DESCRIPTION: Composite: Renders a blue line between points (351, 62) and (160, 247) then Sets a single blue pixel at (264, 200) then Places a white 37x64 rectangle at position (351, 46).
; PLAN: r0=351(x1), r1=62(y1), r2=160(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=200(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=46(y), r12=37(width), r13=64(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 62
LDI r2, 160
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 200
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 46
LDI r12, 37
LDI r13, 64
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
