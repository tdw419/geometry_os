; DESCRIPTION: Composite: Places a red dot at position (493, 77) then Draws a orange rectangle at (296, 80) with width 78 and height 80.
; PLAN: r0=493(x), r1=77(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=80(y), r7=78(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 77
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 296
LDI r6, 80
LDI r7, 78
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
