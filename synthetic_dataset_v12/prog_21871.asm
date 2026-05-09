; DESCRIPTION: Composite: Renders a orange box of size 15x30 starting at (307, 53) then Places a red line segment connecting (476, 189) to (244, 199) then Places a orange dot at position (42, 149).
; PLAN: r0=307(x), r1=53(y), r2=15(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x1), r6=189(y1), r7=244(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=149(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 53
LDI r2, 15
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 189
LDI r7, 244
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 149
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
