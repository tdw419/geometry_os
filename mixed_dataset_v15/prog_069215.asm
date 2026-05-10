; DESCRIPTION: Composite: Places a orange dot at position (262, 175) then Draws a black rectangle at (143, 153) with width 112 and height 103 then Places a white line segment connecting (417, 220) to (430, 220).
; PLAN: r0=262(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=153(y), r7=112(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=220(y1), r12=430(x2), r13=220(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 143
LDI r6, 153
LDI r7, 112
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 220
LDI r12, 430
LDI r13, 220
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
