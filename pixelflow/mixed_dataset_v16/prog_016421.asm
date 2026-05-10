; DESCRIPTION: Composite: Renders a magenta box of size 100x99 starting at (283, 70) then Sets a single cyan pixel at (490, 78) then Places a cyan line segment connecting (341, 70) to (391, 242).
; PLAN: r0=283(x), r1=70(y), r2=100(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=78(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=341(x1), r11=70(y1), r12=391(x2), r13=242(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 70
LDI r2, 100
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 78
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 341
LDI r11, 70
LDI r12, 391
LDI r13, 242
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
