; DESCRIPTION: Composite: Draws a red circle centered at (404, 153) with radius 38 then Places a blue line segment connecting (405, 65) to (356, 203).
; PLAN: r0=404(x), r1=153(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x1), r6=65(y1), r7=356(x2), r8=203(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 153
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 65
LDI r7, 356
LDI r8, 203
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
