; DESCRIPTION: Composite: Places a white circle of radius 76 at center (133, 168) then Places a magenta 32x97 rectangle at position (99, 62) then Places a cyan line segment connecting (164, 150) to (332, 182).
; PLAN: r0=133(x), r1=168(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=62(y), r7=32(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x1), r11=150(y1), r12=332(x2), r13=182(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 168
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 62
LDI r7, 32
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 150
LDI r12, 332
LDI r13, 182
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
