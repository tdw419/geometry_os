; DESCRIPTION: Composite: Sets a single white pixel at (328, 47) then Draws a magenta rectangle at (99, 180) with width 97 and height 30.
; PLAN: r0=328(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=180(y), r7=97(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 180
LDI r7, 97
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
