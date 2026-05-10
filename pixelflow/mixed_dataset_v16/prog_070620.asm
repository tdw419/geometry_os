; DESCRIPTION: Composite: Places a yellow line segment connecting (111, 29) to (211, 50) then Creates a red rectangular region at (404, 44) spanning 80 by 119 pixels.
; PLAN: r0=111(x1), r1=29(y1), r2=211(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=44(y), r7=80(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 29
LDI r2, 211
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 44
LDI r7, 80
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
