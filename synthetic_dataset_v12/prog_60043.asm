; DESCRIPTION: Composite: Draws a cyan circle centered at (473, 111) with radius 12 then Draws a black rectangle at (392, 53) with width 118 and height 40.
; PLAN: r0=473(x), r1=111(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=53(y), r7=118(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 111
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 53
LDI r7, 118
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
