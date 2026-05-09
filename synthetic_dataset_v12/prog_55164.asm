; DESCRIPTION: Composite: Draws a white rectangle at (346, 99) with width 83 and height 16 then Creates a cyan circular shape at (363, 75) with radius 30 then Renders a purple line between points (491, 218) and (179, 213).
; PLAN: r0=346(x), r1=99(y), r2=83(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=75(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=491(x1), r11=218(y1), r12=179(x2), r13=213(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 99
LDI r2, 83
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 75
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 491
LDI r11, 218
LDI r12, 179
LDI r13, 213
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
