; DESCRIPTION: Composite: Renders a yellow disk with center (66, 121) and radius 66 then Creates a red rectangular region at (26, 109) spanning 57 by 29 pixels.
; PLAN: r0=66(x), r1=121(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=109(y), r7=57(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 121
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 109
LDI r7, 57
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
