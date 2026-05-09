; DESCRIPTION: Composite: Sets a single black pixel at (157, 252) then Renders a blue box of size 54x20 starting at (50, 175).
; PLAN: r0=157(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=175(y), r7=54(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 50
LDI r6, 175
LDI r7, 54
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
