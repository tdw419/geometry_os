; DESCRIPTION: Composite: Sets a single green pixel at (180, 69) then Draws a green rectangle at (130, 107) with width 115 and height 52.
; PLAN: r0=180(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=107(y), r7=115(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 69
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 130
LDI r6, 107
LDI r7, 115
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
