; DESCRIPTION: Composite: Renders a orange disk with center (387, 54) and radius 20 then Creates a red rectangular region at (329, 118) spanning 98 by 29 pixels.
; PLAN: r0=387(x), r1=54(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=118(y), r7=98(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 54
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 118
LDI r7, 98
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
