; DESCRIPTION: Composite: Draws a purple line from (106, 222) to (332, 210) then Places a red 114x64 rectangle at position (192, 44) then Renders a red disk with center (56, 196) and radius 31.
; PLAN: r0=106(x1), r1=222(y1), r2=332(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=44(y), r7=114(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=196(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 222
LDI r2, 332
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 44
LDI r7, 114
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 196
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
