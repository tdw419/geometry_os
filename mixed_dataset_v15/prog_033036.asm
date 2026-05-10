; DESCRIPTION: Composite: Creates a blue rectangular region at (398, 65) spanning 15 by 71 pixels then Places a black circle of radius 63 at center (365, 191) then Places a cyan line segment connecting (64, 5) to (452, 25).
; PLAN: r0=398(x), r1=65(y), r2=15(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=191(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x1), r11=5(y1), r12=452(x2), r13=25(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 65
LDI r2, 15
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 191
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 5
LDI r12, 452
LDI r13, 25
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
