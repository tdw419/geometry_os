; DESCRIPTION: Composite: Places a red circle of radius 56 at center (423, 70) then Places a purple 84x113 rectangle at position (78, 138) then Places a green dot at position (399, 147).
; PLAN: r0=423(x), r1=70(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=138(y), r7=84(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=147(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 70
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 138
LDI r7, 84
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 147
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
