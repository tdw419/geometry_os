; DESCRIPTION: Composite: Places a green 17x113 rectangle at position (81, 19) then Renders a orange line between points (363, 134) and (228, 253) then Creates a magenta circular shape at (117, 197) with radius 25.
; PLAN: r0=81(x), r1=19(y), r2=17(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x1), r6=134(y1), r7=228(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=197(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 19
LDI r2, 17
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 134
LDI r7, 228
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 197
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
