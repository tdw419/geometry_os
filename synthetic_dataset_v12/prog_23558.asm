; DESCRIPTION: Composite: Places a orange circle of radius 12 at center (268, 22) then Draws a white rectangle at (289, 158) with width 30 and height 81 then Sets a single white pixel at (502, 91).
; PLAN: r0=268(x), r1=22(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=158(y), r7=30(width), r8=81(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=502(x), r11=91(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 22
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 158
LDI r7, 30
LDI r8, 81
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 91
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
