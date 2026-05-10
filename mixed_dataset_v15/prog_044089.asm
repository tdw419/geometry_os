; DESCRIPTION: Composite: Places a blue dot at position (3, 216) then Draws a green rectangle at (339, 23) with width 66 and height 120.
; PLAN: r0=3(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=23(y), r7=66(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 23
LDI r7, 66
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
