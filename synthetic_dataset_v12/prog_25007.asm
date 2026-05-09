; DESCRIPTION: Composite: Draws a orange line from (289, 70) to (116, 130) then Places a yellow 65x65 rectangle at position (84, 37) then Places a blue dot at position (220, 6).
; PLAN: r0=289(x1), r1=70(y1), r2=116(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=37(y), r7=65(width), r8=65(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x), r11=6(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 70
LDI r2, 116
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 37
LDI r7, 65
LDI r8, 65
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 6
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
