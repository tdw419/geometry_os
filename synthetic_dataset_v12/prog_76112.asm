; DESCRIPTION: Composite: Renders a red disk with center (259, 70) and radius 63 then Places a yellow line segment connecting (46, 148) to (289, 140) then Places a blue 30x98 rectangle at position (49, 150).
; PLAN: r0=259(x), r1=70(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x1), r6=148(y1), r7=289(x2), r8=140(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=150(y), r12=30(width), r13=98(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 70
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 148
LDI r7, 289
LDI r8, 140
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 150
LDI r12, 30
LDI r13, 98
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
