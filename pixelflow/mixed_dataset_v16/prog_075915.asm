; DESCRIPTION: Composite: Creates a magenta circular shape at (103, 40) with radius 24 then Places a orange 96x73 rectangle at position (79, 107) then Renders a red line between points (158, 1) and (287, 206).
; PLAN: r0=103(x), r1=40(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=107(y), r7=96(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x1), r11=1(y1), r12=287(x2), r13=206(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 40
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 107
LDI r7, 96
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 1
LDI r12, 287
LDI r13, 206
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
