; DESCRIPTION: Composite: Creates a green rectangular region at (133, 80) spanning 64 by 16 pixels then Renders a red disk with center (405, 29) and radius 27.
; PLAN: r0=133(x), r1=80(y), r2=64(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=29(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 80
LDI r2, 64
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 29
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
