; DESCRIPTION: Composite: Renders a yellow disk with center (146, 123) and radius 50 then Renders a yellow line between points (391, 175) and (414, 156).
; PLAN: r0=146(x), r1=123(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=175(y1), r7=414(x2), r8=156(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 123
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 175
LDI r7, 414
LDI r8, 156
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
