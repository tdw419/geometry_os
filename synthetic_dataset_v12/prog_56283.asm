; DESCRIPTION: Composite: Renders a red line between points (261, 254) and (380, 201) then Draws a blue rectangle at (220, 135) with width 108 and height 40.
; PLAN: r0=261(x1), r1=254(y1), r2=380(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=135(y), r7=108(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 254
LDI r2, 380
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 135
LDI r7, 108
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
