; DESCRIPTION: Composite: Places a black 42x74 rectangle at position (318, 104) then Renders a magenta line between points (509, 184) and (168, 229) then Places a green circle of radius 35 at center (181, 132).
; PLAN: r0=318(x), r1=104(y), r2=42(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x1), r6=184(y1), r7=168(x2), r8=229(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=181(x), r11=132(y), r12=35(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 318
LDI r1, 104
LDI r2, 42
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 184
LDI r7, 168
LDI r8, 229
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 132
LDI r12, 35
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
