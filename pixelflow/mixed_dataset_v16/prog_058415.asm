; DESCRIPTION: Composite: Draws a cyan line from (265, 244) to (225, 148) then Creates a blue circular shape at (283, 148) with radius 47.
; PLAN: r0=265(x1), r1=244(y1), r2=225(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=148(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 244
LDI r2, 225
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 148
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
