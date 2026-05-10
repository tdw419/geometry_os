; DESCRIPTION: Composite: Places a yellow dot at position (146, 207) then Renders a white box of size 15x99 starting at (447, 37) then Draws a orange circle centered at (429, 84) with radius 50.
; PLAN: r0=146(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=37(y), r7=15(width), r8=99(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=84(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 447
LDI r6, 37
LDI r7, 15
LDI r8, 99
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 84
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
