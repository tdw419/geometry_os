; DESCRIPTION: Composite: Renders a cyan disk with center (320, 55) and radius 40 then Creates a purple rectangular region at (281, 102) spanning 19 by 34 pixels.
; PLAN: r0=320(x), r1=55(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=102(y), r7=19(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 55
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 102
LDI r7, 19
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
