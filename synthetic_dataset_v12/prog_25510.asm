; DESCRIPTION: Composite: Draws a green rectangle at (126, 144) with width 27 and height 58 then Draws a blue line from (200, 210) to (375, 6).
; PLAN: r0=126(x), r1=144(y), r2=27(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=210(y1), r7=375(x2), r8=6(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 144
LDI r2, 27
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 210
LDI r7, 375
LDI r8, 6
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
