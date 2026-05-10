; DESCRIPTION: Composite: Draws a orange rectangle at (220, 214) with width 105 and height 18 then Draws a yellow line from (58, 224) to (6, 20).
; PLAN: r0=220(x), r1=214(y), r2=105(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x1), r6=224(y1), r7=6(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 214
LDI r2, 105
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 224
LDI r7, 6
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
