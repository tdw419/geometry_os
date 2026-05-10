; DESCRIPTION: Composite: Places a green 19x42 rectangle at position (102, 102) then Creates a orange circular shape at (151, 173) with radius 28 then Renders a blue line between points (392, 118) and (366, 170).
; PLAN: r0=102(x), r1=102(y), r2=19(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=173(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x1), r11=118(y1), r12=366(x2), r13=170(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 102
LDI r2, 19
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 173
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 118
LDI r12, 366
LDI r13, 170
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
