; DESCRIPTION: Composite: Places a orange line segment connecting (217, 243) to (150, 91) then Places a red dot at position (203, 88) then Places a black 18x76 rectangle at position (61, 80).
; PLAN: r0=217(x1), r1=243(y1), r2=150(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=88(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=80(y), r12=18(width), r13=76(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 243
LDI r2, 150
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 88
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 61
LDI r11, 80
LDI r12, 18
LDI r13, 76
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
