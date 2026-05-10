; DESCRIPTION: Composite: Draws a red rectangle at (32, 112) with width 71 and height 49 then Places a purple dot at position (92, 72) then Renders a red line between points (184, 164) and (484, 97).
; PLAN: r0=32(x), r1=112(y), r2=71(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=72(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=184(x1), r11=164(y1), r12=484(x2), r13=97(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 112
LDI r2, 71
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 72
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 184
LDI r11, 164
LDI r12, 484
LDI r13, 97
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
