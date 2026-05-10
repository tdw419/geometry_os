; DESCRIPTION: Composite: Draws a cyan rectangle at (341, 166) with width 53 and height 42 then Draws a purple line from (223, 215) to (137, 11) then Places a yellow circle of radius 37 at center (47, 113).
; PLAN: r0=341(x), r1=166(y), r2=53(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x1), r6=215(y1), r7=137(x2), r8=11(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=113(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 166
LDI r2, 53
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 215
LDI r7, 137
LDI r8, 11
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 113
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
