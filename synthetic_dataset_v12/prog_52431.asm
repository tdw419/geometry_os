; DESCRIPTION: Composite: Places a green 18x111 rectangle at position (447, 29) then Renders a red disk with center (124, 224) and radius 18 then Renders a purple line between points (288, 199) and (256, 192).
; PLAN: r0=447(x), r1=29(y), r2=18(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=224(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x1), r11=199(y1), r12=256(x2), r13=192(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 29
LDI r2, 18
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 224
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 199
LDI r12, 256
LDI r13, 192
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
