; DESCRIPTION: Composite: Places a magenta line segment connecting (341, 15) to (72, 137) then Renders a cyan box of size 76x50 starting at (81, 67) then Sets a single white pixel at (497, 110).
; PLAN: r0=341(x1), r1=15(y1), r2=72(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=67(y), r7=76(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x), r11=110(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 15
LDI r2, 72
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 67
LDI r7, 76
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 110
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
