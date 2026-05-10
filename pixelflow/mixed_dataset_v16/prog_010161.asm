; DESCRIPTION: Composite: Places a magenta dot at position (3, 124) then Draws a magenta rectangle at (344, 89) with width 59 and height 27.
; PLAN: r0=3(x), r1=124(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=89(y), r7=59(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 124
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 89
LDI r7, 59
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
