; DESCRIPTION: Composite: Places a black dot at position (357, 222) then Places a green line segment connecting (110, 55) to (338, 6) then Draws a white rectangle at (33, 113) with width 109 and height 84.
; PLAN: r0=357(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=55(y1), r7=338(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=113(y), r12=109(width), r13=84(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 110
LDI r6, 55
LDI r7, 338
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 113
LDI r12, 109
LDI r13, 84
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
