; DESCRIPTION: Composite: Places a green dot at position (43, 130) then Places a purple 83x81 rectangle at position (198, 77) then Places a white line segment connecting (278, 199) to (134, 204).
; PLAN: r0=43(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=77(y), r7=83(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x1), r11=199(y1), r12=134(x2), r13=204(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 198
LDI r6, 77
LDI r7, 83
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 199
LDI r12, 134
LDI r13, 204
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
