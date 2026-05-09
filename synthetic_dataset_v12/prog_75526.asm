; DESCRIPTION: Composite: Draws a blue line from (308, 204) to (492, 41) then Creates a magenta circular shape at (452, 86) with radius 32.
; PLAN: r0=308(x1), r1=204(y1), r2=492(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=86(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 204
LDI r2, 492
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 86
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
