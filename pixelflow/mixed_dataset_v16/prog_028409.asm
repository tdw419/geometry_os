; DESCRIPTION: Composite: Places a green line segment connecting (199, 151) to (425, 160) then Creates a red rectangular region at (160, 54) spanning 117 by 92 pixels.
; PLAN: r0=199(x1), r1=151(y1), r2=425(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=54(y), r7=117(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 151
LDI r2, 425
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 54
LDI r7, 117
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
