; DESCRIPTION: Composite: Places a white line segment connecting (138, 103) to (7, 97) then Renders a orange disk with center (415, 117) and radius 11.
; PLAN: r0=138(x1), r1=103(y1), r2=7(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=117(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 103
LDI r2, 7
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 117
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
