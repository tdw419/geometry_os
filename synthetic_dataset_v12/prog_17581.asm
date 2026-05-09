; DESCRIPTION: Composite: Places a green dot at position (263, 227) then Renders a cyan box of size 60x62 starting at (278, 71) then Draws a orange circle centered at (45, 48) with radius 30.
; PLAN: r0=263(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=71(y), r7=60(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=48(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 71
LDI r7, 60
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 48
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
