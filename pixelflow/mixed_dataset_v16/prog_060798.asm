; DESCRIPTION: Composite: Draws a magenta line from (453, 48) to (324, 211) then Places a green 101x48 rectangle at position (284, 145) then Creates a purple circular shape at (425, 120) with radius 29.
; PLAN: r0=453(x1), r1=48(y1), r2=324(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=145(y), r7=101(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=120(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 48
LDI r2, 324
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 145
LDI r7, 101
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 120
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
