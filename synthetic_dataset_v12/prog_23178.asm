; DESCRIPTION: Composite: Draws a yellow rectangle at (172, 51) with width 55 and height 71 then Places a white dot at position (284, 208) then Places a green line segment connecting (175, 137) to (462, 115).
; PLAN: r0=172(x), r1=51(y), r2=55(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=175(x1), r11=137(y1), r12=462(x2), r13=115(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 51
LDI r2, 55
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 175
LDI r11, 137
LDI r12, 462
LDI r13, 115
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
