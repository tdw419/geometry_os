; DESCRIPTION: Composite: Renders a yellow box of size 97x36 starting at (377, 131) then Draws a green circle centered at (280, 194) with radius 59.
; PLAN: r0=377(x), r1=131(y), r2=97(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=194(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 131
LDI r2, 97
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 194
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
