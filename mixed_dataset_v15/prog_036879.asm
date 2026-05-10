; DESCRIPTION: Composite: Places a red line segment connecting (482, 118) to (105, 233) then Draws a cyan circle centered at (277, 56) with radius 53.
; PLAN: r0=482(x1), r1=118(y1), r2=105(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=56(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 118
LDI r2, 105
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 56
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
