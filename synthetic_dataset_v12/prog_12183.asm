; DESCRIPTION: Composite: Sets a single magenta pixel at (155, 209) then Draws a black line from (309, 36) to (168, 13) then Creates a orange rectangular region at (62, 170) spanning 13 by 42 pixels.
; PLAN: r0=155(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=36(y1), r7=168(x2), r8=13(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=170(y), r12=13(width), r13=42(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 36
LDI r7, 168
LDI r8, 13
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 170
LDI r12, 13
LDI r13, 42
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
