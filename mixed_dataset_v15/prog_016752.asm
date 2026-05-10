; DESCRIPTION: Composite: Renders a blue disk with center (281, 105) and radius 27 then Renders a orange line between points (164, 148) and (156, 87).
; PLAN: r0=281(x), r1=105(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x1), r6=148(y1), r7=156(x2), r8=87(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 105
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 148
LDI r7, 156
LDI r8, 87
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
