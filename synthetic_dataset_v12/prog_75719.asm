; DESCRIPTION: Composite: Places a white circle of radius 35 at center (277, 128) then Places a blue 81x117 rectangle at position (370, 67) then Draws a green line from (458, 199) to (167, 125).
; PLAN: r0=277(x), r1=128(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=67(y), r7=81(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x1), r11=199(y1), r12=167(x2), r13=125(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 128
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 67
LDI r7, 81
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 199
LDI r12, 167
LDI r13, 125
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
