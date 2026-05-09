; DESCRIPTION: Composite: Places a white line segment connecting (19, 229) to (336, 55) then Renders a yellow disk with center (97, 107) and radius 26 then Places a yellow 77x84 rectangle at position (19, 89).
; PLAN: r0=19(x1), r1=229(y1), r2=336(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=107(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=89(y), r12=77(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 229
LDI r2, 336
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 107
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 89
LDI r12, 77
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
