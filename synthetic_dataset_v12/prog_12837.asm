; DESCRIPTION: Composite: Creates a black circular shape at (176, 139) with radius 80 then Draws a cyan line from (166, 19) to (462, 201) then Places a blue 111x59 rectangle at position (266, 172).
; PLAN: r0=176(x), r1=139(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=19(y1), r7=462(x2), r8=201(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=172(y), r12=111(width), r13=59(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 139
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 19
LDI r7, 462
LDI r8, 201
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 172
LDI r12, 111
LDI r13, 59
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
