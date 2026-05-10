; DESCRIPTION: Composite: Sets a single orange pixel at (202, 178) then Places a blue line segment connecting (284, 42) to (274, 78) then Places a purple 14x87 rectangle at position (144, 67).
; PLAN: r0=202(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=42(y1), r7=274(x2), r8=78(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=67(y), r12=14(width), r13=87(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 284
LDI r6, 42
LDI r7, 274
LDI r8, 78
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 67
LDI r12, 14
LDI r13, 87
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
