; DESCRIPTION: Composite: Sets a single green pixel at (100, 148) then Draws a red rectangle at (329, 90) with width 28 and height 13.
; PLAN: r0=100(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=90(y), r7=28(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 90
LDI r7, 28
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
