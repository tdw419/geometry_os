; DESCRIPTION: Composite: Places a black circle of radius 68 at center (81, 72) then Renders a magenta line between points (243, 113) and (139, 35) then Places a black 13x117 rectangle at position (310, 30).
; PLAN: r0=81(x), r1=72(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=113(y1), r7=139(x2), r8=35(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=30(y), r12=13(width), r13=117(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 72
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 113
LDI r7, 139
LDI r8, 35
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 30
LDI r12, 13
LDI r13, 117
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
