; DESCRIPTION: Composite: Places a green 106x57 rectangle at position (3, 93) then Places a magenta line segment connecting (154, 91) to (76, 128) then Places a orange circle of radius 17 at center (480, 192).
; PLAN: r0=3(x), r1=93(y), r2=106(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=91(y1), r7=76(x2), r8=128(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=480(x), r11=192(y), r12=17(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 93
LDI r2, 106
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 91
LDI r7, 76
LDI r8, 128
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 192
LDI r12, 17
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
