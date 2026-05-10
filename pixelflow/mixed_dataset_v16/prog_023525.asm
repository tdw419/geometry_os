; DESCRIPTION: Composite: Draws a red line from (193, 95) to (307, 134) then Places a black 69x116 rectangle at position (274, 73) then Renders a magenta disk with center (347, 195) and radius 44.
; PLAN: r0=193(x1), r1=95(y1), r2=307(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=73(y), r7=69(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=195(y), r12=44(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 95
LDI r2, 307
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 73
LDI r7, 69
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 195
LDI r12, 44
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
