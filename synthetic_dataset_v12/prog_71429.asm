; DESCRIPTION: Composite: Draws a green rectangle at (393, 50) with width 16 and height 36 then Renders a red disk with center (454, 97) and radius 30.
; PLAN: r0=393(x), r1=50(y), r2=16(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=97(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 50
LDI r2, 16
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 97
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
