; DESCRIPTION: Composite: Sets a single white pixel at (374, 174) then Draws a magenta rectangle at (120, 128) with width 106 and height 20.
; PLAN: r0=374(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=128(y), r7=106(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 128
LDI r7, 106
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
