; DESCRIPTION: Composite: Draws a green rectangle at (294, 70) with width 33 and height 92 then Draws a yellow line from (375, 113) to (288, 176).
; PLAN: r0=294(x), r1=70(y), r2=33(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=113(y1), r7=288(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 70
LDI r2, 33
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 113
LDI r7, 288
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
