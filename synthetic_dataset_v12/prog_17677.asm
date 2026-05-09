; DESCRIPTION: Composite: Renders a orange disk with center (90, 128) and radius 70 then Draws a yellow line from (339, 148) to (506, 132).
; PLAN: r0=90(x), r1=128(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x1), r6=148(y1), r7=506(x2), r8=132(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 128
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 148
LDI r7, 506
LDI r8, 132
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
