; DESCRIPTION: Composite: Creates a magenta rectangular region at (410, 173) spanning 34 by 64 pixels then Places a white line segment connecting (376, 251) to (9, 139).
; PLAN: r0=410(x), r1=173(y), r2=34(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x1), r6=251(y1), r7=9(x2), r8=139(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 173
LDI r2, 34
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 251
LDI r7, 9
LDI r8, 139
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
