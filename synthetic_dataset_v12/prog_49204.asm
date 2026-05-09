; DESCRIPTION: Composite: Renders a yellow disk with center (286, 131) and radius 25 then Draws a black rectangle at (385, 72) with width 56 and height 44.
; PLAN: r0=286(x), r1=131(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=72(y), r7=56(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 131
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 72
LDI r7, 56
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
