; DESCRIPTION: Composite: Creates a black rectangular region at (28, 116) spanning 27 by 117 pixels then Places a yellow circle of radius 40 at center (92, 145) then Renders a white line between points (165, 179) and (505, 240).
; PLAN: r0=28(x), r1=116(y), r2=27(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=145(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x1), r11=179(y1), r12=505(x2), r13=240(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 116
LDI r2, 27
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 145
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 179
LDI r12, 505
LDI r13, 240
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
