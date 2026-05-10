; DESCRIPTION: Composite: Places a blue circle of radius 14 at center (473, 236) then Renders a green box of size 39x15 starting at (258, 118) then Renders a green line between points (104, 212) and (418, 186).
; PLAN: r0=473(x), r1=236(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=118(y), r7=39(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x1), r11=212(y1), r12=418(x2), r13=186(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 236
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 118
LDI r7, 39
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 212
LDI r12, 418
LDI r13, 186
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
