; DESCRIPTION: Composite: Creates a cyan rectangular region at (318, 81) spanning 21 by 51 pixels then Renders a cyan disk with center (295, 60) and radius 58.
; PLAN: r0=318(x), r1=81(y), r2=21(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=60(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 81
LDI r2, 21
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 60
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
