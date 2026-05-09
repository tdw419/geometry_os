; DESCRIPTION: Composite: Places a white circle of radius 47 at center (169, 122) then Creates a magenta rectangular region at (110, 143) spanning 60 by 20 pixels.
; PLAN: r0=169(x), r1=122(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=143(y), r7=60(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 122
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 143
LDI r7, 60
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
