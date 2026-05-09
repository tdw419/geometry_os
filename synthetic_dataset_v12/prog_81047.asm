; DESCRIPTION: Composite: Places a red 16x49 rectangle at position (274, 204) then Places a red dot at position (192, 162) then Places a orange line segment connecting (230, 25) to (148, 14).
; PLAN: r0=274(x), r1=204(y), r2=16(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=162(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=230(x1), r11=25(y1), r12=148(x2), r13=14(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 204
LDI r2, 16
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 162
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 230
LDI r11, 25
LDI r12, 148
LDI r13, 14
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
