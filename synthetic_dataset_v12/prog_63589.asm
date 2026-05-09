; DESCRIPTION: Composite: Places a red circle of radius 46 at center (227, 111) then Draws a red rectangle at (385, 44) with width 92 and height 80.
; PLAN: r0=227(x), r1=111(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=44(y), r7=92(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 111
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 44
LDI r7, 92
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
