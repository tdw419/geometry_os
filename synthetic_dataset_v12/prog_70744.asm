; DESCRIPTION: Composite: Creates a orange rectangular region at (307, 144) spanning 60 by 81 pixels then Draws a yellow circle centered at (76, 207) with radius 23 then Draws a black line from (338, 61) to (42, 126).
; PLAN: r0=307(x), r1=144(y), r2=60(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=207(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x1), r11=61(y1), r12=42(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 144
LDI r2, 60
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 207
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 61
LDI r12, 42
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
