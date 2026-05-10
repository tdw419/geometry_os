; DESCRIPTION: Composite: Places a magenta 16x68 rectangle at position (386, 142) then Draws a orange circle centered at (253, 177) with radius 64 then Places a red line segment connecting (190, 207) to (31, 210).
; PLAN: r0=386(x), r1=142(y), r2=16(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=177(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x1), r11=207(y1), r12=31(x2), r13=210(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 142
LDI r2, 16
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 177
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 207
LDI r12, 31
LDI r13, 210
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
