; DESCRIPTION: Composite: Places a green 110x66 rectangle at position (167, 24) then Renders a purple disk with center (310, 190) and radius 44 then Renders a purple line between points (274, 249) and (100, 1).
; PLAN: r0=167(x), r1=24(y), r2=110(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=190(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x1), r11=249(y1), r12=100(x2), r13=1(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 24
LDI r2, 110
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 190
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 249
LDI r12, 100
LDI r13, 1
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
