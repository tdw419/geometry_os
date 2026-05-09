; DESCRIPTION: Composite: Places a red circle of radius 18 at center (113, 165) then Draws a magenta line from (287, 24) to (443, 212) then Places a green 17x86 rectangle at position (363, 157).
; PLAN: r0=113(x), r1=165(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x1), r6=24(y1), r7=443(x2), r8=212(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=157(y), r12=17(width), r13=86(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 165
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 24
LDI r7, 443
LDI r8, 212
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 157
LDI r12, 17
LDI r13, 86
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
