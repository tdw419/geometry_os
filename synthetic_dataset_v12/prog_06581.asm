; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (90, 192) then Draws a white line from (376, 68) to (215, 9) then Renders a blue box of size 110x42 starting at (342, 126).
; PLAN: r0=90(x), r1=192(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x1), r6=68(y1), r7=215(x2), r8=9(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=126(y), r12=110(width), r13=42(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 192
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 68
LDI r7, 215
LDI r8, 9
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 126
LDI r12, 110
LDI r13, 42
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
