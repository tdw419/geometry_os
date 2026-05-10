; DESCRIPTION: Composite: Sets a single orange pixel at (340, 231) then Draws a white rectangle at (205, 13) with width 119 and height 25.
; PLAN: r0=340(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=13(y), r7=119(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 205
LDI r6, 13
LDI r7, 119
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
