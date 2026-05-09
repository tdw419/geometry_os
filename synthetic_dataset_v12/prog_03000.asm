; DESCRIPTION: Composite: Renders a magenta disk with center (141, 125) and radius 26 then Places a cyan 55x68 rectangle at position (411, 41) then Renders a yellow line between points (301, 142) and (87, 116).
; PLAN: r0=141(x), r1=125(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=41(y), r7=55(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x1), r11=142(y1), r12=87(x2), r13=116(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 125
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 41
LDI r7, 55
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 142
LDI r12, 87
LDI r13, 116
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
