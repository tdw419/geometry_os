; DESCRIPTION: Composite: Creates a blue circular shape at (62, 63) with radius 62 then Places a white line segment connecting (66, 207) to (303, 30) then Places a green 59x52 rectangle at position (143, 27).
; PLAN: r0=62(x), r1=63(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=207(y1), r7=303(x2), r8=30(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=27(y), r12=59(width), r13=52(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 63
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 207
LDI r7, 303
LDI r8, 30
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 27
LDI r12, 59
LDI r13, 52
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
