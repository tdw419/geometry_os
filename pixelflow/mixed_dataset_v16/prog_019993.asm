; DESCRIPTION: Composite: Creates a cyan rectangular region at (289, 94) spanning 95 by 115 pixels then Renders a green disk with center (435, 55) and radius 47.
; PLAN: r0=289(x), r1=94(y), r2=95(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=55(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 94
LDI r2, 95
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 55
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
