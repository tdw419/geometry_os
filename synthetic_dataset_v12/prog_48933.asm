; DESCRIPTION: Composite: Places a green dot at position (424, 83) then Draws a green rectangle at (410, 100) with width 10 and height 42.
; PLAN: r0=424(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=100(y), r7=10(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 100
LDI r7, 10
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
