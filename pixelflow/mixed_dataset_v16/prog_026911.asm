; DESCRIPTION: Composite: Renders a yellow line between points (449, 58) and (473, 58) then Draws a red circle centered at (389, 150) with radius 19 then Places a red 94x37 rectangle at position (417, 31).
; PLAN: r0=449(x1), r1=58(y1), r2=473(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=150(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=31(y), r12=94(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 58
LDI r2, 473
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 150
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 31
LDI r12, 94
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
