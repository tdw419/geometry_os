; DESCRIPTION: Composite: Renders a yellow line between points (85, 226) and (140, 222) then Places a yellow circle of radius 53 at center (278, 189) then Places a green 21x27 rectangle at position (193, 166).
; PLAN: r0=85(x1), r1=226(y1), r2=140(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=189(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=166(y), r12=21(width), r13=27(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 226
LDI r2, 140
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 189
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 166
LDI r12, 21
LDI r13, 27
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
