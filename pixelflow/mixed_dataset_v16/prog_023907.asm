; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 91) then Creates a magenta rectangular region at (387, 39) spanning 42 by 16 pixels then Creates a magenta circular shape at (149, 167) with radius 55.
; PLAN: r0=493(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=39(y), r7=42(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=167(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 91
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 39
LDI r7, 42
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 167
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
