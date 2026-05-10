; DESCRIPTION: Composite: Places a orange 82x40 rectangle at position (60, 132) then Sets a single red pixel at (359, 159) then Draws a green circle centered at (250, 173) with radius 65.
; PLAN: r0=60(x), r1=132(y), r2=82(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=159(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=173(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 132
LDI r2, 82
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 159
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 250
LDI r11, 173
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
