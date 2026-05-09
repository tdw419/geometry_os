; DESCRIPTION: Composite: Places a green 40x30 rectangle at position (229, 208) then Sets a single orange pixel at (445, 243) then Creates a blue circular shape at (100, 91) with radius 12.
; PLAN: r0=229(x), r1=208(y), r2=40(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=243(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=100(x), r11=91(y), r12=12(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 208
LDI r2, 40
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 243
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 100
LDI r11, 91
LDI r12, 12
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
