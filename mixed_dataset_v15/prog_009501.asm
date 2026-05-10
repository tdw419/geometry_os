; DESCRIPTION: Composite: Draws a blue circle centered at (249, 96) with radius 70 then Renders a purple box of size 98x71 starting at (68, 95) then Places a red line segment connecting (310, 254) to (275, 18).
; PLAN: r0=249(x), r1=96(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=95(y), r7=98(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x1), r11=254(y1), r12=275(x2), r13=18(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 96
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 95
LDI r7, 98
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 254
LDI r12, 275
LDI r13, 18
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
