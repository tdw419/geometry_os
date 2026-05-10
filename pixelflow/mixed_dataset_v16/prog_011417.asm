; DESCRIPTION: Composite: Places a white circle of radius 71 at center (98, 152) then Creates a magenta rectangular region at (164, 50) spanning 47 by 38 pixels.
; PLAN: r0=98(x), r1=152(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=50(y), r7=47(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 152
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 50
LDI r7, 47
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
