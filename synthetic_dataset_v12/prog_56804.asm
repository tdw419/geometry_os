; DESCRIPTION: Composite: Places a cyan line segment connecting (122, 175) to (23, 50) then Sets a single black pixel at (257, 90) then Renders a magenta box of size 74x104 starting at (90, 30).
; PLAN: r0=122(x1), r1=175(y1), r2=23(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=30(y), r12=74(width), r13=104(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 175
LDI r2, 23
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 90
LDI r11, 30
LDI r12, 74
LDI r13, 104
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
