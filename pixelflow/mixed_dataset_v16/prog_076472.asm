; DESCRIPTION: Composite: Places a blue 75x70 rectangle at position (381, 48) then Sets a single orange pixel at (178, 32) then Draws a black line from (20, 12) to (190, 78).
; PLAN: r0=381(x), r1=48(y), r2=75(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=20(x1), r11=12(y1), r12=190(x2), r13=78(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 48
LDI r2, 75
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 20
LDI r11, 12
LDI r12, 190
LDI r13, 78
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
