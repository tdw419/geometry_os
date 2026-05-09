; DESCRIPTION: Composite: Sets a single black pixel at (355, 59) then Draws a green rectangle at (300, 55) with width 35 and height 12.
; PLAN: r0=355(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=55(y), r7=35(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 55
LDI r7, 35
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
