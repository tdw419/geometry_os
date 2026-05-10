; DESCRIPTION: Composite: Creates a orange circular shape at (310, 68) with radius 54 then Draws a white line from (249, 125) to (436, 5).
; PLAN: r0=310(x), r1=68(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=125(y1), r7=436(x2), r8=5(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 68
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 125
LDI r7, 436
LDI r8, 5
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
