; DESCRIPTION: Composite: Renders a blue disk with center (229, 97) and radius 68 then Draws a white rectangle at (23, 143) with width 120 and height 62.
; PLAN: r0=229(x), r1=97(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=143(y), r7=120(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 97
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 143
LDI r7, 120
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
