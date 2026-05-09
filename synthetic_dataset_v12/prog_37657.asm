; DESCRIPTION: Composite: Places a white line segment connecting (448, 208) to (393, 139) then Places a purple circle of radius 73 at center (90, 97) then Places a magenta 84x10 rectangle at position (74, 135).
; PLAN: r0=448(x1), r1=208(y1), r2=393(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=97(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=135(y), r12=84(width), r13=10(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 208
LDI r2, 393
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 97
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 135
LDI r12, 84
LDI r13, 10
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
