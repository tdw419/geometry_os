; DESCRIPTION: Composite: Places a yellow 62x60 rectangle at position (175, 152) then Places a cyan line segment connecting (63, 177) to (240, 135) then Draws a yellow circle centered at (299, 140) with radius 10.
; PLAN: r0=175(x), r1=152(y), r2=62(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=177(y1), r7=240(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=140(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 152
LDI r2, 62
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 177
LDI r7, 240
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 140
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
