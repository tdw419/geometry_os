; DESCRIPTION: Composite: Places a yellow dot at position (441, 77) then Draws a magenta rectangle at (161, 116) with width 111 and height 88.
; PLAN: r0=441(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=116(y), r7=111(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 161
LDI r6, 116
LDI r7, 111
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
