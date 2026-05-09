; DESCRIPTION: Composite: Places a cyan 45x14 rectangle at position (326, 200) then Places a yellow line segment connecting (49, 206) to (405, 190) then Renders a magenta disk with center (207, 69) and radius 51.
; PLAN: r0=326(x), r1=200(y), r2=45(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x1), r6=206(y1), r7=405(x2), r8=190(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=69(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 200
LDI r2, 45
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 206
LDI r7, 405
LDI r8, 190
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 69
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
