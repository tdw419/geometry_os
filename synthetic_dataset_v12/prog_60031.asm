; DESCRIPTION: Composite: Renders a green disk with center (328, 39) and radius 33 then Creates a red rectangular region at (31, 80) spanning 23 by 32 pixels.
; PLAN: r0=328(x), r1=39(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=80(y), r7=23(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 39
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 80
LDI r7, 23
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
