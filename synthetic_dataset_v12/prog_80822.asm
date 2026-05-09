; DESCRIPTION: Composite: Creates a magenta rectangular region at (374, 62) spanning 116 by 47 pixels then Places a green circle of radius 68 at center (90, 157).
; PLAN: r0=374(x), r1=62(y), r2=116(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=157(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 62
LDI r2, 116
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 157
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
