; DESCRIPTION: Composite: Places a green dot at position (369, 84) then Draws a orange rectangle at (347, 74) with width 17 and height 113.
; PLAN: r0=369(x), r1=84(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=74(y), r7=17(width), r8=113(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 84
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 347
LDI r6, 74
LDI r7, 17
LDI r8, 113
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
