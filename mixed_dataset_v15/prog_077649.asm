; DESCRIPTION: Composite: Sets a single magenta pixel at (450, 132) then Places a yellow 75x43 rectangle at position (269, 133) then Draws a orange circle centered at (155, 87) with radius 78.
; PLAN: r0=450(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=133(y), r7=75(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=87(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 133
LDI r7, 75
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 87
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
