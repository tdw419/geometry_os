; DESCRIPTION: Composite: Places a orange 75x42 rectangle at position (55, 50) then Sets a single yellow pixel at (13, 37) then Renders a cyan disk with center (249, 140) and radius 25.
; PLAN: r0=55(x), r1=50(y), r2=75(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=37(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=140(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 50
LDI r2, 75
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 37
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 249
LDI r11, 140
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
