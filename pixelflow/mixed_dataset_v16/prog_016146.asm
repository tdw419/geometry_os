; DESCRIPTION: Composite: Creates a white rectangular region at (379, 7) spanning 106 by 27 pixels then Renders a white disk with center (387, 126) and radius 77 then Renders a white line between points (278, 51) and (285, 176).
; PLAN: r0=379(x), r1=7(y), r2=106(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=126(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=278(x1), r11=51(y1), r12=285(x2), r13=176(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 7
LDI r2, 106
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 126
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 278
LDI r11, 51
LDI r12, 285
LDI r13, 176
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
