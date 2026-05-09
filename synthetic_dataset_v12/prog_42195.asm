; DESCRIPTION: Composite: Draws a green circle centered at (104, 191) with radius 45 then Places a purple line segment connecting (371, 10) to (131, 37) then Draws a cyan rectangle at (433, 61) with width 33 and height 57.
; PLAN: r0=104(x), r1=191(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=10(y1), r7=131(x2), r8=37(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=61(y), r12=33(width), r13=57(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 191
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 10
LDI r7, 131
LDI r8, 37
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 61
LDI r12, 33
LDI r13, 57
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
