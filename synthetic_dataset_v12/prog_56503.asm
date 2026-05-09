; DESCRIPTION: Composite: Places a white line segment connecting (494, 66) to (401, 29) then Draws a red rectangle at (204, 16) with width 104 and height 118 then Draws a yellow circle centered at (234, 65) with radius 20.
; PLAN: r0=494(x1), r1=66(y1), r2=401(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=16(y), r7=104(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=65(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 494
LDI r1, 66
LDI r2, 401
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 16
LDI r7, 104
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 65
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
