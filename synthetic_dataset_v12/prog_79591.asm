; DESCRIPTION: Composite: Places a yellow line segment connecting (187, 226) to (320, 250) then Renders a cyan box of size 61x50 starting at (427, 45) then Places a black circle of radius 50 at center (155, 127).
; PLAN: r0=187(x1), r1=226(y1), r2=320(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=45(y), r7=61(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=127(y), r12=50(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 226
LDI r2, 320
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 45
LDI r7, 61
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 127
LDI r12, 50
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
