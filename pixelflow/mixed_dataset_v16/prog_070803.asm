; DESCRIPTION: Composite: Renders a yellow line between points (128, 224) and (483, 0) then Draws a blue rectangle at (370, 19) with width 20 and height 57.
; PLAN: r0=128(x1), r1=224(y1), r2=483(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=19(y), r7=20(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 224
LDI r2, 483
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 19
LDI r7, 20
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
