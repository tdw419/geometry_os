; DESCRIPTION: Composite: Draws a black circle centered at (361, 87) with radius 74 then Renders a green box of size 71x97 starting at (5, 71).
; PLAN: r0=361(x), r1=87(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=71(y), r7=71(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 87
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 71
LDI r7, 71
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
