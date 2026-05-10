; DESCRIPTION: Composite: Creates a white rectangular region at (454, 20) spanning 30 by 47 pixels then Renders a white disk with center (298, 77) and radius 59.
; PLAN: r0=454(x), r1=20(y), r2=30(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=77(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 20
LDI r2, 30
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 77
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
