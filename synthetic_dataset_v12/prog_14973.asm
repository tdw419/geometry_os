; DESCRIPTION: Composite: Places a purple dot at position (277, 73) then Draws a red line from (411, 38) to (298, 221) then Creates a black rectangular region at (55, 72) spanning 61 by 56 pixels.
; PLAN: r0=277(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=38(y1), r7=298(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=72(y), r12=61(width), r13=56(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 38
LDI r7, 298
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 72
LDI r12, 61
LDI r13, 56
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
