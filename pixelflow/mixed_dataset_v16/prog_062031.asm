; DESCRIPTION: Composite: Draws a orange line from (297, 156) to (24, 45) then Places a green circle of radius 48 at center (281, 171).
; PLAN: r0=297(x1), r1=156(y1), r2=24(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=171(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 156
LDI r2, 24
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 171
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
