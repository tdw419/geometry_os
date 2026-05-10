; DESCRIPTION: Composite: Creates a purple circular shape at (417, 76) with radius 55 then Renders a blue box of size 30x68 starting at (275, 15) then Renders a magenta line between points (154, 194) and (72, 135).
; PLAN: r0=417(x), r1=76(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=15(y), r7=30(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=194(y1), r12=72(x2), r13=135(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 76
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 15
LDI r7, 30
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 194
LDI r12, 72
LDI r13, 135
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
