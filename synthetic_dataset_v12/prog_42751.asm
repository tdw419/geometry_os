; DESCRIPTION: Composite: Places a red circle of radius 51 at center (374, 54) then Draws a orange rectangle at (321, 80) with width 71 and height 26.
; PLAN: r0=374(x), r1=54(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=80(y), r7=71(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 54
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 80
LDI r7, 71
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
