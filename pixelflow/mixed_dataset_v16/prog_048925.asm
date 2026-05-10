; DESCRIPTION: Composite: Creates a cyan circular shape at (296, 191) with radius 36 then Places a yellow line segment connecting (124, 30) to (5, 134) then Draws a red rectangle at (238, 97) with width 63 and height 38.
; PLAN: r0=296(x), r1=191(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=30(y1), r7=5(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=97(y), r12=63(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 191
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 30
LDI r7, 5
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 97
LDI r12, 63
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
