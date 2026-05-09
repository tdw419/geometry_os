; DESCRIPTION: Composite: Sets a single black pixel at (457, 46) then Draws a red rectangle at (205, 72) with width 117 and height 87.
; PLAN: r0=457(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=72(y), r7=117(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 205
LDI r6, 72
LDI r7, 117
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
