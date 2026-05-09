; DESCRIPTION: Composite: Sets a single magenta pixel at (381, 124) then Places a yellow line segment connecting (480, 126) to (114, 62) then Renders a black box of size 91x74 starting at (123, 110).
; PLAN: r0=381(x), r1=124(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=480(x1), r6=126(y1), r7=114(x2), r8=62(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=110(y), r12=91(width), r13=74(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 124
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 126
LDI r7, 114
LDI r8, 62
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 110
LDI r12, 91
LDI r13, 74
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
