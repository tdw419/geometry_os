; DESCRIPTION: Composite: Places a blue circle of radius 23 at center (94, 47) then Places a blue 33x81 rectangle at position (404, 104) then Places a blue line segment connecting (111, 134) to (20, 220).
; PLAN: r0=94(x), r1=47(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=104(y), r7=33(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=134(y1), r12=20(x2), r13=220(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 47
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 104
LDI r7, 33
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 134
LDI r12, 20
LDI r13, 220
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
