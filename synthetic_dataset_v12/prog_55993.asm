; DESCRIPTION: Composite: Creates a green rectangular region at (32, 116) spanning 82 by 116 pixels then Renders a green disk with center (236, 54) and radius 54.
; PLAN: r0=32(x), r1=116(y), r2=82(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=54(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 32
LDI r1, 116
LDI r2, 82
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 54
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
