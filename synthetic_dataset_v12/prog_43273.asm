; DESCRIPTION: Composite: Creates a green rectangular region at (144, 173) spanning 64 by 49 pixels then Places a white line segment connecting (62, 92) to (480, 143).
; PLAN: r0=144(x), r1=173(y), r2=64(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=92(y1), r7=480(x2), r8=143(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 173
LDI r2, 64
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 92
LDI r7, 480
LDI r8, 143
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
