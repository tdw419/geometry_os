; DESCRIPTION: Composite: Draws a red circle centered at (387, 142) with radius 58 then Renders a green line between points (355, 114) and (176, 103) then Places a green 105x104 rectangle at position (51, 61).
; PLAN: r0=387(x), r1=142(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x1), r6=114(y1), r7=176(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=61(y), r12=105(width), r13=104(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 142
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 114
LDI r7, 176
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 61
LDI r12, 105
LDI r13, 104
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
