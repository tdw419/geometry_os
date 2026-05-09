; DESCRIPTION: Composite: Sets a single green pixel at (279, 10) then Draws a black rectangle at (221, 138) with width 89 and height 110.
; PLAN: r0=279(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=138(y), r7=89(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 138
LDI r7, 89
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
