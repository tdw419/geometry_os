; DESCRIPTION: Composite: Draws a cyan rectangle at (133, 102) with width 57 and height 114 then Sets a single white pixel at (342, 111) then Places a white line segment connecting (505, 196) to (492, 22).
; PLAN: r0=133(x), r1=102(y), r2=57(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=111(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=505(x1), r11=196(y1), r12=492(x2), r13=22(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 102
LDI r2, 57
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 111
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 505
LDI r11, 196
LDI r12, 492
LDI r13, 22
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
