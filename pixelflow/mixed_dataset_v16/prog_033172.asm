; DESCRIPTION: Composite: Places a yellow line segment connecting (491, 165) to (150, 160) then Renders a cyan box of size 72x15 starting at (125, 73) then Draws a magenta circle centered at (449, 72) with radius 62.
; PLAN: r0=491(x1), r1=165(y1), r2=150(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=73(y), r7=72(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=449(x), r11=72(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 491
LDI r1, 165
LDI r2, 150
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 73
LDI r7, 72
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 72
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
