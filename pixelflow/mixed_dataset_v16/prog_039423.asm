; DESCRIPTION: Composite: Places a white 80x38 rectangle at position (280, 159) then Draws a magenta circle centered at (71, 95) with radius 33 then Draws a white line from (174, 211) to (181, 198).
; PLAN: r0=280(x), r1=159(y), r2=80(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=95(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x1), r11=211(y1), r12=181(x2), r13=198(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 159
LDI r2, 80
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 95
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 211
LDI r12, 181
LDI r13, 198
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
