; DESCRIPTION: Composite: Places a black line segment connecting (2, 82) to (453, 78) then Renders a orange box of size 111x28 starting at (358, 106) then Sets a single magenta pixel at (441, 2).
; PLAN: r0=2(x1), r1=82(y1), r2=453(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=106(y), r7=111(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=2(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 82
LDI r2, 453
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 106
LDI r7, 111
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 2
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
