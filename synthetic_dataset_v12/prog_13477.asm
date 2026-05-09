; DESCRIPTION: Composite: Renders a red line between points (140, 133) and (157, 13) then Creates a yellow circular shape at (247, 131) with radius 79 then Places a orange 57x64 rectangle at position (140, 10).
; PLAN: r0=140(x1), r1=133(y1), r2=157(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=131(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=10(y), r12=57(width), r13=64(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 133
LDI r2, 157
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 131
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 10
LDI r12, 57
LDI r13, 64
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
