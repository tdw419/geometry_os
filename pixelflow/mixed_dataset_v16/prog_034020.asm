; DESCRIPTION: Composite: Renders a cyan line between points (478, 20) and (79, 147) then Creates a cyan circular shape at (187, 87) with radius 44 then Places a blue 46x58 rectangle at position (310, 131).
; PLAN: r0=478(x1), r1=20(y1), r2=79(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=87(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=131(y), r12=46(width), r13=58(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 20
LDI r2, 79
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 87
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 131
LDI r12, 46
LDI r13, 58
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
