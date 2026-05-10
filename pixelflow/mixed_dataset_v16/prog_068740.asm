; DESCRIPTION: Composite: Sets a single red pixel at (484, 56) then Draws a white rectangle at (419, 14) with width 81 and height 98 then Renders a magenta disk with center (290, 185) and radius 56.
; PLAN: r0=484(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=14(y), r7=81(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=185(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 419
LDI r6, 14
LDI r7, 81
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 185
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
