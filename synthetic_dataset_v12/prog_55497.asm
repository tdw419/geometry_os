; DESCRIPTION: Composite: Renders a red disk with center (244, 100) and radius 13 then Creates a red rectangular region at (275, 164) spanning 99 by 18 pixels.
; PLAN: r0=244(x), r1=100(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=164(y), r7=99(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 100
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 164
LDI r7, 99
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
