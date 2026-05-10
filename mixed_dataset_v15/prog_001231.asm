; DESCRIPTION: Composite: Places a white line segment connecting (12, 5) to (446, 177) then Draws a white circle centered at (111, 155) with radius 59.
; PLAN: r0=12(x1), r1=5(y1), r2=446(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=155(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 5
LDI r2, 446
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 155
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
