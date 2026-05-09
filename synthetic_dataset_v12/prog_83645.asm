; DESCRIPTION: Composite: Places a yellow dot at position (413, 134) then Creates a red rectangular region at (150, 115) spanning 55 by 63 pixels then Draws a magenta circle centered at (398, 173) with radius 43.
; PLAN: r0=413(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=115(y), r7=55(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=173(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 150
LDI r6, 115
LDI r7, 55
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 173
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
