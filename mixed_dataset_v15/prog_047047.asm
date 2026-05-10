; DESCRIPTION: Composite: Draws a red circle centered at (423, 133) with radius 73 then Renders a red line between points (72, 52) and (171, 84) then Places a black 46x24 rectangle at position (341, 177).
; PLAN: r0=423(x), r1=133(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x1), r6=52(y1), r7=171(x2), r8=84(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=177(y), r12=46(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 133
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 52
LDI r7, 171
LDI r8, 84
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 177
LDI r12, 46
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
