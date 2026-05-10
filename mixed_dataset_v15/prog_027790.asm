; DESCRIPTION: Composite: Renders a magenta line between points (91, 107) and (482, 20) then Draws a red circle centered at (336, 64) with radius 47.
; PLAN: r0=91(x1), r1=107(y1), r2=482(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=64(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 107
LDI r2, 482
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 64
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
