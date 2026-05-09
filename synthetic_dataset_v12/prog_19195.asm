; DESCRIPTION: Composite: Draws a purple rectangle at (60, 120) with width 80 and height 77 then Renders a red disk with center (321, 83) and radius 78.
; PLAN: r0=60(x), r1=120(y), r2=80(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=83(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 120
LDI r2, 80
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 83
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
