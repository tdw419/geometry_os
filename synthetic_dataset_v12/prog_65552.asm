; DESCRIPTION: Composite: Places a green dot at position (38, 229) then Renders a purple box of size 26x43 starting at (230, 140) then Renders a magenta disk with center (49, 146) and radius 47.
; PLAN: r0=38(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=140(y), r7=26(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x), r11=146(y), r12=47(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 229
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 230
LDI r6, 140
LDI r7, 26
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 146
LDI r12, 47
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
