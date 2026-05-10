; DESCRIPTION: Composite: Renders a blue box of size 36x114 starting at (185, 39) then Creates a blue circular shape at (249, 204) with radius 40 then Places a cyan line segment connecting (189, 244) to (160, 104).
; PLAN: r0=185(x), r1=39(y), r2=36(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=204(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=244(y1), r12=160(x2), r13=104(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 39
LDI r2, 36
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 204
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 244
LDI r12, 160
LDI r13, 104
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
