; DESCRIPTION: Composite: Places a yellow circle of radius 77 at center (378, 112) then Draws a green rectangle at (178, 177) with width 89 and height 59.
; PLAN: r0=378(x), r1=112(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=177(y), r7=89(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 112
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 177
LDI r7, 89
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
