; DESCRIPTION: Composite: Sets a single green pixel at (152, 71) then Draws a white rectangle at (188, 134) with width 25 and height 44 then Places a cyan line segment connecting (229, 144) to (412, 239).
; PLAN: r0=152(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=134(y), r7=25(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x1), r11=144(y1), r12=412(x2), r13=239(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 188
LDI r6, 134
LDI r7, 25
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 144
LDI r12, 412
LDI r13, 239
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
