; DESCRIPTION: Composite: Draws a yellow rectangle at (234, 84) with width 74 and height 119 then Places a magenta dot at position (242, 162) then Places a red line segment connecting (340, 58) to (264, 178).
; PLAN: r0=234(x), r1=84(y), r2=74(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=340(x1), r11=58(y1), r12=264(x2), r13=178(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 84
LDI r2, 74
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 58
LDI r12, 264
LDI r13, 178
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
