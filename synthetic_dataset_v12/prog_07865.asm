; DESCRIPTION: Composite: Draws a cyan line from (294, 162) to (441, 125) then Places a black circle of radius 68 at center (346, 165) then Draws a green rectangle at (24, 116) with width 36 and height 31.
; PLAN: r0=294(x1), r1=162(y1), r2=441(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=165(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=116(y), r12=36(width), r13=31(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 162
LDI r2, 441
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 165
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 116
LDI r12, 36
LDI r13, 31
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
