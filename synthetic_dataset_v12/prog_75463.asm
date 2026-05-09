; DESCRIPTION: Composite: Renders a white disk with center (316, 64) and radius 43 then Draws a magenta line from (122, 245) to (225, 205).
; PLAN: r0=316(x), r1=64(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=245(y1), r7=225(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 64
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 245
LDI r7, 225
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
