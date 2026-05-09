; DESCRIPTION: Composite: Places a green line segment connecting (191, 123) to (139, 215) then Places a cyan 33x74 rectangle at position (332, 42) then Places a red circle of radius 56 at center (250, 117).
; PLAN: r0=191(x1), r1=123(y1), r2=139(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=42(y), r7=33(width), r8=74(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=117(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 123
LDI r2, 139
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 42
LDI r7, 33
LDI r8, 74
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 117
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
