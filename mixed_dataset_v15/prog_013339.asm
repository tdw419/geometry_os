; DESCRIPTION: Composite: Draws a cyan rectangle at (296, 146) with width 65 and height 87 then Places a magenta dot at position (416, 127) then Creates a blue circular shape at (66, 130) with radius 24.
; PLAN: r0=296(x), r1=146(y), r2=65(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=130(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 146
LDI r2, 65
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 130
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
