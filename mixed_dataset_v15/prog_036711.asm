; DESCRIPTION: Composite: Places a cyan circle of radius 59 at center (247, 62) then Creates a yellow rectangular region at (17, 77) spanning 21 by 118 pixels.
; PLAN: r0=247(x), r1=62(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=77(y), r7=21(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 62
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 77
LDI r7, 21
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
