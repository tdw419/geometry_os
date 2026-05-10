; DESCRIPTION: Composite: Places a yellow circle of radius 35 at center (287, 80) then Draws a red rectangle at (130, 54) with width 39 and height 103.
; PLAN: r0=287(x), r1=80(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=54(y), r7=39(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 80
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 54
LDI r7, 39
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
