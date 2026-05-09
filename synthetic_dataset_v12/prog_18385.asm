; DESCRIPTION: Composite: Creates a orange circular shape at (420, 74) with radius 39 then Renders a orange line between points (17, 44) and (444, 142).
; PLAN: r0=420(x), r1=74(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=44(y1), r7=444(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 74
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 44
LDI r7, 444
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
