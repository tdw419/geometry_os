; DESCRIPTION: Composite: Renders a purple box of size 94x96 starting at (355, 103) then Draws a purple line from (435, 116) to (341, 16) then Creates a green circular shape at (281, 37) with radius 32.
; PLAN: r0=355(x), r1=103(y), r2=94(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=116(y1), r7=341(x2), r8=16(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=37(y), r12=32(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 103
LDI r2, 94
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 116
LDI r7, 341
LDI r8, 16
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 37
LDI r12, 32
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
