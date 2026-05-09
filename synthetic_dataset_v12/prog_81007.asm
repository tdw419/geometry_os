; DESCRIPTION: Composite: Renders a magenta disk with center (345, 117) and radius 51 then Renders a black line between points (158, 58) and (42, 66) then Places a purple 43x84 rectangle at position (184, 31).
; PLAN: r0=345(x), r1=117(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x1), r6=58(y1), r7=42(x2), r8=66(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=31(y), r12=43(width), r13=84(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 117
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 58
LDI r7, 42
LDI r8, 66
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 31
LDI r12, 43
LDI r13, 84
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
