; DESCRIPTION: Composite: Creates a magenta circular shape at (460, 56) with radius 50 then Renders a yellow line between points (141, 32) and (329, 72) then Draws a orange rectangle at (290, 237) with width 59 and height 13.
; PLAN: r0=460(x), r1=56(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=32(y1), r7=329(x2), r8=72(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=237(y), r12=59(width), r13=13(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 56
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 32
LDI r7, 329
LDI r8, 72
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 237
LDI r12, 59
LDI r13, 13
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
