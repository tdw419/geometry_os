; DESCRIPTION: Composite: Places a red line segment connecting (203, 41) to (117, 91) then Places a magenta circle of radius 32 at center (352, 217) then Places a orange dot at position (280, 206).
; PLAN: r0=203(x1), r1=41(y1), r2=117(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=217(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=206(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 41
LDI r2, 117
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 217
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 206
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
