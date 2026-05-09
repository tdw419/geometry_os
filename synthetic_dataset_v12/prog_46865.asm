; DESCRIPTION: Composite: Places a yellow circle of radius 72 at center (80, 120) then Draws a black rectangle at (49, 85) with width 94 and height 111.
; PLAN: r0=80(x), r1=120(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=85(y), r7=94(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 120
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 85
LDI r7, 94
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
