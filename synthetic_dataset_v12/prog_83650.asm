; DESCRIPTION: Composite: Sets a single orange pixel at (184, 216) then Places a red 49x115 rectangle at position (286, 17) then Places a blue line segment connecting (261, 120) to (23, 64).
; PLAN: r0=184(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=17(y), r7=49(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x1), r11=120(y1), r12=23(x2), r13=64(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 286
LDI r6, 17
LDI r7, 49
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 120
LDI r12, 23
LDI r13, 64
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
