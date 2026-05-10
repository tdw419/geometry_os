; DESCRIPTION: Composite: Places a orange circle of radius 39 at center (46, 124) then Creates a white rectangular region at (57, 10) spanning 75 by 112 pixels.
; PLAN: r0=46(x), r1=124(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=10(y), r7=75(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 124
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 10
LDI r7, 75
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
