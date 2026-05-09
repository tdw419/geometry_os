; DESCRIPTION: Composite: Creates a cyan circular shape at (182, 186) with radius 13 then Creates a purple rectangular region at (83, 39) spanning 111 by 39 pixels.
; PLAN: r0=182(x), r1=186(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=39(y), r7=111(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 186
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 39
LDI r7, 111
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
