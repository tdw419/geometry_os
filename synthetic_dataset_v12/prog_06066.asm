; DESCRIPTION: Composite: Draws a green circle centered at (372, 111) with radius 66 then Draws a blue line from (184, 153) to (481, 114).
; PLAN: r0=372(x), r1=111(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=153(y1), r7=481(x2), r8=114(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 111
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 153
LDI r7, 481
LDI r8, 114
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
