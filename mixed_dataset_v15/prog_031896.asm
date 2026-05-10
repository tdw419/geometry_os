; DESCRIPTION: Composite: Draws a cyan line from (428, 70) to (167, 126) then Creates a red circular shape at (192, 21) with radius 15 then Draws a blue rectangle at (1, 175) with width 23 and height 48.
; PLAN: r0=428(x1), r1=70(y1), r2=167(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=21(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=175(y), r12=23(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 70
LDI r2, 167
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 21
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 175
LDI r12, 23
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
