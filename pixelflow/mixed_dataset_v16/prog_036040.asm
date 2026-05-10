; DESCRIPTION: Composite: Draws a yellow rectangle at (191, 9) with width 87 and height 24 then Renders a blue line between points (436, 74) and (117, 248).
; PLAN: r0=191(x), r1=9(y), r2=87(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x1), r6=74(y1), r7=117(x2), r8=248(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 9
LDI r2, 87
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 74
LDI r7, 117
LDI r8, 248
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
