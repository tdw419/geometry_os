; DESCRIPTION: Composite: Places a cyan circle of radius 10 at center (10, 44) then Creates a green rectangular region at (276, 155) spanning 59 by 73 pixels.
; PLAN: r0=10(x), r1=44(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=155(y), r7=59(width), r8=73(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 44
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 155
LDI r7, 59
LDI r8, 73
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
