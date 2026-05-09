; DESCRIPTION: Composite: Renders a purple disk with center (188, 181) and radius 70 then Places a blue 116x120 rectangle at position (78, 53) then Renders a magenta line between points (273, 236) and (63, 101).
; PLAN: r0=188(x), r1=181(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=53(y), r7=116(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x1), r11=236(y1), r12=63(x2), r13=101(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 181
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 53
LDI r7, 116
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 236
LDI r12, 63
LDI r13, 101
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
