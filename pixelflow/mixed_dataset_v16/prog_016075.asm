; DESCRIPTION: Composite: Places a white line segment connecting (276, 20) to (441, 59) then Renders a magenta box of size 77x72 starting at (153, 34).
; PLAN: r0=276(x1), r1=20(y1), r2=441(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=34(y), r7=77(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 20
LDI r2, 441
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 34
LDI r7, 77
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
