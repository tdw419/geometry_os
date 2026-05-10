; DESCRIPTION: Composite: Draws a purple circle centered at (429, 213) with radius 20 then Draws a red rectangle at (77, 21) with width 61 and height 52.
; PLAN: r0=429(x), r1=213(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=21(y), r7=61(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 213
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 21
LDI r7, 61
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
