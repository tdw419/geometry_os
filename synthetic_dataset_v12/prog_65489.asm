; DESCRIPTION: Composite: Renders a white box of size 12x68 starting at (59, 124) then Renders a purple disk with center (72, 203) and radius 33.
; PLAN: r0=59(x), r1=124(y), r2=12(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=203(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 124
LDI r2, 12
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 203
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
