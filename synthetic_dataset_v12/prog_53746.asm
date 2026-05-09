; DESCRIPTION: Composite: Renders a magenta disk with center (38, 179) and radius 22 then Renders a yellow line between points (306, 57) and (408, 222) then Places a green 95x54 rectangle at position (138, 132).
; PLAN: r0=38(x), r1=179(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=57(y1), r7=408(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=132(y), r12=95(width), r13=54(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 179
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 57
LDI r7, 408
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 132
LDI r12, 95
LDI r13, 54
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
