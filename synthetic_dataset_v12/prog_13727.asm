; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (475, 124) then Places a green 58x15 rectangle at position (449, 171) then Places a red line segment connecting (208, 45) to (409, 250).
; PLAN: r0=475(x), r1=124(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=171(y), r7=58(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x1), r11=45(y1), r12=409(x2), r13=250(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 124
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 171
LDI r7, 58
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 45
LDI r12, 409
LDI r13, 250
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
