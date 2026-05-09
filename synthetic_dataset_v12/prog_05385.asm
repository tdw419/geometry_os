; DESCRIPTION: Composite: Creates a red rectangular region at (260, 135) spanning 12 by 65 pixels then Places a green line segment connecting (312, 3) to (200, 239).
; PLAN: r0=260(x), r1=135(y), r2=12(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=3(y1), r7=200(x2), r8=239(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 135
LDI r2, 12
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 3
LDI r7, 200
LDI r8, 239
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
