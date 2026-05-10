; DESCRIPTION: Composite: Creates a white rectangular region at (39, 58) spanning 28 by 59 pixels then Creates a green circular shape at (289, 196) with radius 40 then Renders a red line between points (144, 39) and (179, 125).
; PLAN: r0=39(x), r1=58(y), r2=28(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=196(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x1), r11=39(y1), r12=179(x2), r13=125(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 58
LDI r2, 28
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 196
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 39
LDI r12, 179
LDI r13, 125
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
