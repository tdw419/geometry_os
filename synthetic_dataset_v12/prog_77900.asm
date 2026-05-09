; DESCRIPTION: Composite: Creates a white rectangular region at (174, 112) spanning 70 by 72 pixels then Renders a purple disk with center (358, 138) and radius 65.
; PLAN: r0=174(x), r1=112(y), r2=70(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=138(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 112
LDI r2, 70
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 138
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
