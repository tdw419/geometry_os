; DESCRIPTION: Composite: Places a white circle of radius 33 at center (179, 140) then Draws a orange rectangle at (419, 23) with width 54 and height 117.
; PLAN: r0=179(x), r1=140(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=23(y), r7=54(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 140
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 23
LDI r7, 54
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
