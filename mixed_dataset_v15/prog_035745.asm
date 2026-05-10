; DESCRIPTION: Composite: Places a magenta 14x55 rectangle at position (89, 146) then Sets a single white pixel at (466, 42) then Draws a orange circle centered at (290, 83) with radius 61.
; PLAN: r0=89(x), r1=146(y), r2=14(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=42(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=83(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 146
LDI r2, 14
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 42
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 290
LDI r11, 83
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
