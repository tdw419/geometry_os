; DESCRIPTION: Composite: Places a green dot at position (374, 133) then Places a blue line segment connecting (284, 200) to (49, 144) then Draws a orange rectangle at (139, 39) with width 103 and height 112.
; PLAN: r0=374(x), r1=133(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=200(y1), r7=49(x2), r8=144(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=39(y), r12=103(width), r13=112(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 133
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 200
LDI r7, 49
LDI r8, 144
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 39
LDI r12, 103
LDI r13, 112
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
