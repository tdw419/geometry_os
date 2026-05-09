; DESCRIPTION: Composite: Sets a single magenta pixel at (414, 150) then Draws a white rectangle at (21, 118) with width 60 and height 112.
; PLAN: r0=414(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=118(y), r7=60(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 118
LDI r7, 60
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
