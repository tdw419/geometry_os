; DESCRIPTION: Composite: Draws a black rectangle at (362, 68) with width 32 and height 113 then Places a blue line segment connecting (0, 126) to (406, 64) then Renders a magenta disk with center (159, 135) and radius 42.
; PLAN: r0=362(x), r1=68(y), r2=32(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x1), r6=126(y1), r7=406(x2), r8=64(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=135(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 68
LDI r2, 32
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 126
LDI r7, 406
LDI r8, 64
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 135
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
