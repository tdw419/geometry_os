; DESCRIPTION: Composite: Creates a white rectangular region at (399, 8) spanning 26 by 99 pixels then Renders a yellow line between points (418, 254) and (391, 148).
; PLAN: r0=399(x), r1=8(y), r2=26(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=254(y1), r7=391(x2), r8=148(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 8
LDI r2, 26
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 254
LDI r7, 391
LDI r8, 148
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
