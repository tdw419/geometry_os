; DESCRIPTION: Composite: Renders a cyan line between points (502, 163) and (497, 179) then Renders a magenta disk with center (187, 63) and radius 29 then Draws a green rectangle at (137, 150) with width 62 and height 69.
; PLAN: r0=502(x1), r1=163(y1), r2=497(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=63(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x), r11=150(y), r12=62(width), r13=69(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 163
LDI r2, 497
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 63
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 150
LDI r12, 62
LDI r13, 69
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
