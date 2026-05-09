; DESCRIPTION: Composite: Draws a blue line from (205, 109) to (473, 58) then Places a red 45x85 rectangle at position (397, 91) then Renders a cyan disk with center (334, 139) and radius 36.
; PLAN: r0=205(x1), r1=109(y1), r2=473(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=91(y), r7=45(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=139(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 109
LDI r2, 473
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 91
LDI r7, 45
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 139
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
