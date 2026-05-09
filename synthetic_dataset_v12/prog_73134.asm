; DESCRIPTION: Composite: Renders a red line between points (244, 196) and (210, 126) then Sets a single purple pixel at (334, 224) then Draws a white rectangle at (92, 199) with width 118 and height 22.
; PLAN: r0=244(x1), r1=196(y1), r2=210(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=224(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=199(y), r12=118(width), r13=22(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 196
LDI r2, 210
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 224
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 199
LDI r12, 118
LDI r13, 22
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
