; DESCRIPTION: Composite: Sets a single yellow pixel at (179, 254) then Places a yellow line segment connecting (324, 223) to (171, 42) then Draws a red circle centered at (154, 76) with radius 30.
; PLAN: r0=179(x), r1=254(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=223(y1), r7=171(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=76(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 254
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 324
LDI r6, 223
LDI r7, 171
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 76
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
