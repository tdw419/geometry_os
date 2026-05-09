; DESCRIPTION: Composite: Draws a magenta line from (144, 26) to (282, 227) then Places a blue circle of radius 57 at center (283, 184).
; PLAN: r0=144(x1), r1=26(y1), r2=282(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=184(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 26
LDI r2, 282
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 184
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
