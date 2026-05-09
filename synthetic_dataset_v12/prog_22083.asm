; DESCRIPTION: Composite: Sets a single green pixel at (421, 145) then Places a white line segment connecting (492, 211) to (160, 233) then Draws a green rectangle at (404, 67) with width 23 and height 108.
; PLAN: r0=421(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=211(y1), r7=160(x2), r8=233(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=67(y), r12=23(width), r13=108(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 492
LDI r6, 211
LDI r7, 160
LDI r8, 233
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 67
LDI r12, 23
LDI r13, 108
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
