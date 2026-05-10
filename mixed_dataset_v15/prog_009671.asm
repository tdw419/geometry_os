; DESCRIPTION: Composite: Renders a white disk with center (329, 111) and radius 62 then Draws a magenta rectangle at (127, 10) with width 91 and height 48 then Draws a green line from (242, 155) to (465, 185).
; PLAN: r0=329(x), r1=111(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=10(y), r7=91(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x1), r11=155(y1), r12=465(x2), r13=185(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 111
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 10
LDI r7, 91
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 155
LDI r12, 465
LDI r13, 185
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
