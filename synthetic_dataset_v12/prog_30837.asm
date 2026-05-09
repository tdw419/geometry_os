; DESCRIPTION: Composite: Creates a red circular shape at (87, 190) with radius 25 then Draws a green rectangle at (204, 106) with width 120 and height 80.
; PLAN: r0=87(x), r1=190(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=106(y), r7=120(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 190
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 106
LDI r7, 120
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
