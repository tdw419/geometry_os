; DESCRIPTION: Composite: Places a red line segment connecting (372, 5) to (13, 173) then Creates a green rectangular region at (409, 88) spanning 92 by 60 pixels.
; PLAN: r0=372(x1), r1=5(y1), r2=13(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=88(y), r7=92(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 5
LDI r2, 13
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 88
LDI r7, 92
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
