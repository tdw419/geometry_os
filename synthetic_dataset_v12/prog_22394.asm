; DESCRIPTION: Composite: Creates a green circular shape at (160, 52) with radius 24 then Draws a magenta line from (444, 12) to (134, 184).
; PLAN: r0=160(x), r1=52(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x1), r6=12(y1), r7=134(x2), r8=184(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 52
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 12
LDI r7, 134
LDI r8, 184
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
