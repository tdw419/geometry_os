; DESCRIPTION: Composite: Draws a black line from (456, 96) to (277, 84) then Draws a green circle centered at (192, 184) with radius 66 then Places a magenta 28x63 rectangle at position (399, 93).
; PLAN: r0=456(x1), r1=96(y1), r2=277(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=184(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=93(y), r12=28(width), r13=63(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 96
LDI r2, 277
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 184
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 93
LDI r12, 28
LDI r13, 63
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
