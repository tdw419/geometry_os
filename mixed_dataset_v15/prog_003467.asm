; DESCRIPTION: Composite: Draws a magenta rectangle at (200, 117) with width 76 and height 42 then Places a black dot at position (342, 183) then Places a magenta line segment connecting (225, 177) to (481, 48).
; PLAN: r0=200(x), r1=117(y), r2=76(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=183(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=225(x1), r11=177(y1), r12=481(x2), r13=48(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 117
LDI r2, 76
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 183
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 225
LDI r11, 177
LDI r12, 481
LDI r13, 48
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
