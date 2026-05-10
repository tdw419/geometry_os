; DESCRIPTION: Composite: Places a red circle of radius 18 at center (86, 80) then Places a magenta line segment connecting (449, 97) to (440, 56) then Places a red 93x67 rectangle at position (6, 56).
; PLAN: r0=86(x), r1=80(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=97(y1), r7=440(x2), r8=56(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=6(x), r11=56(y), r12=93(width), r13=67(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 80
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 97
LDI r7, 440
LDI r8, 56
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 56
LDI r12, 93
LDI r13, 67
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
