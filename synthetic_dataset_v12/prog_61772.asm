; DESCRIPTION: Composite: Draws a magenta circle centered at (279, 91) with radius 72 then Draws a purple line from (61, 91) to (242, 6) then Draws a orange rectangle at (387, 70) with width 109 and height 43.
; PLAN: r0=279(x), r1=91(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x1), r6=91(y1), r7=242(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=70(y), r12=109(width), r13=43(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 91
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 91
LDI r7, 242
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 70
LDI r12, 109
LDI r13, 43
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
