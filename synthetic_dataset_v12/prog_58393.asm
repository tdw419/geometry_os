; DESCRIPTION: Composite: Renders a blue box of size 20x13 starting at (392, 91) then Sets a single cyan pixel at (280, 157) then Renders a black disk with center (251, 164) and radius 68.
; PLAN: r0=392(x), r1=91(y), r2=20(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=164(y), r12=68(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 91
LDI r2, 20
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 251
LDI r11, 164
LDI r12, 68
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
