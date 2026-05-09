; DESCRIPTION: Composite: Renders a green box of size 32x53 starting at (426, 2) then Draws a magenta line from (239, 251) to (441, 53) then Renders a red disk with center (289, 89) and radius 23.
; PLAN: r0=426(x), r1=2(y), r2=32(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=251(y1), r7=441(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=89(y), r12=23(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 2
LDI r2, 32
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 251
LDI r7, 441
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 89
LDI r12, 23
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
