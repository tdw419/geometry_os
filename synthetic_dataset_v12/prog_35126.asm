; DESCRIPTION: Composite: Sets a single magenta pixel at (226, 105) then Draws a yellow rectangle at (47, 223) with width 75 and height 23.
; PLAN: r0=226(x), r1=105(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=223(y), r7=75(width), r8=23(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 105
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 47
LDI r6, 223
LDI r7, 75
LDI r8, 23
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
