; DESCRIPTION: Composite: Places a green line segment connecting (384, 160) to (166, 119) then Sets a single purple pixel at (183, 117) then Places a red 33x11 rectangle at position (85, 120).
; PLAN: r0=384(x1), r1=160(y1), r2=166(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=117(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=120(y), r12=33(width), r13=11(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 160
LDI r2, 166
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 117
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 85
LDI r11, 120
LDI r12, 33
LDI r13, 11
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
