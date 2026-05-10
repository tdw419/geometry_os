; DESCRIPTION: Composite: Draws a white circle centered at (271, 195) with radius 30 then Draws a red rectangle at (156, 108) with width 45 and height 114 then Renders a blue line between points (330, 51) and (27, 1).
; PLAN: r0=271(x), r1=195(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=108(y), r7=45(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x1), r11=51(y1), r12=27(x2), r13=1(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 195
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 108
LDI r7, 45
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 51
LDI r12, 27
LDI r13, 1
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
