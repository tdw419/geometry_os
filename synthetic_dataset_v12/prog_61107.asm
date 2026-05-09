; DESCRIPTION: Composite: Places a white line segment connecting (499, 84) to (382, 37) then Draws a orange circle centered at (277, 184) with radius 68.
; PLAN: r0=499(x1), r1=84(y1), r2=382(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=184(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 84
LDI r2, 382
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 184
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
