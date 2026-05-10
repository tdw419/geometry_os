; DESCRIPTION: Composite: Creates a green rectangular region at (328, 166) spanning 120 by 71 pixels then Creates a white circular shape at (247, 155) with radius 46.
; PLAN: r0=328(x), r1=166(y), r2=120(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=155(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 166
LDI r2, 120
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 155
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
