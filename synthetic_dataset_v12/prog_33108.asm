; DESCRIPTION: Composite: Creates a yellow circular shape at (87, 195) with radius 59 then Places a green 19x79 rectangle at position (64, 86) then Renders a black line between points (177, 67) and (249, 117).
; PLAN: r0=87(x), r1=195(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=86(y), r7=19(width), r8=79(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=67(y1), r12=249(x2), r13=117(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 195
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 86
LDI r7, 19
LDI r8, 79
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 67
LDI r12, 249
LDI r13, 117
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
