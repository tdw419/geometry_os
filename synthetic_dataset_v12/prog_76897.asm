; DESCRIPTION: Composite: Places a purple circle of radius 27 at center (360, 142) then Draws a white line from (239, 198) to (289, 53) then Places a red 60x41 rectangle at position (235, 206).
; PLAN: r0=360(x), r1=142(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x1), r6=198(y1), r7=289(x2), r8=53(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=206(y), r12=60(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 142
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 198
LDI r7, 289
LDI r8, 53
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 206
LDI r12, 60
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
