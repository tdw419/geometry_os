; DESCRIPTION: Composite: Creates a white circular shape at (125, 172) with radius 77 then Places a red 118x86 rectangle at position (14, 121) then Places a white line segment connecting (96, 183) to (102, 142).
; PLAN: r0=125(x), r1=172(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=121(y), r7=118(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x1), r11=183(y1), r12=102(x2), r13=142(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 172
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 121
LDI r7, 118
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 183
LDI r12, 102
LDI r13, 142
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
