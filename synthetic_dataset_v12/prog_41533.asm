; DESCRIPTION: Composite: Draws a cyan circle centered at (168, 175) with radius 74 then Places a purple line segment connecting (487, 72) to (227, 209) then Places a black 76x77 rectangle at position (147, 9).
; PLAN: r0=168(x), r1=175(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=72(y1), r7=227(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=9(y), r12=76(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 175
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 72
LDI r7, 227
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 9
LDI r12, 76
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
