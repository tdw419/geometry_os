; DESCRIPTION: Composite: Places a yellow line segment connecting (199, 25) to (356, 173) then Creates a red rectangular region at (367, 4) spanning 18 by 14 pixels.
; PLAN: r0=199(x1), r1=25(y1), r2=356(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=4(y), r7=18(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 25
LDI r2, 356
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 4
LDI r7, 18
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
