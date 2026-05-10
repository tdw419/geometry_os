; DESCRIPTION: Composite: Draws a purple rectangle at (92, 164) with width 101 and height 63 then Places a white dot at position (92, 62) then Draws a yellow line from (467, 228) to (14, 80).
; PLAN: r0=92(x), r1=164(y), r2=101(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=62(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=467(x1), r11=228(y1), r12=14(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 164
LDI r2, 101
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 62
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 467
LDI r11, 228
LDI r12, 14
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
