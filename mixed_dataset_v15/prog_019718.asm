; DESCRIPTION: Composite: Places a green line segment connecting (329, 62) to (474, 255) then Places a blue 56x100 rectangle at position (224, 147) then Creates a magenta circular shape at (354, 52) with radius 12.
; PLAN: r0=329(x1), r1=62(y1), r2=474(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=147(y), r7=56(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=52(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 62
LDI r2, 474
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 147
LDI r7, 56
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 52
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
