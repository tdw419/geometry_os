; DESCRIPTION: Composite: Sets a single red pixel at (48, 7) then Draws a green rectangle at (192, 17) with width 30 and height 25.
; PLAN: r0=48(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=17(y), r7=30(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 7
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 192
LDI r6, 17
LDI r7, 30
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
