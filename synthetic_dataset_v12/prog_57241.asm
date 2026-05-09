; DESCRIPTION: Composite: Draws a cyan circle centered at (211, 183) with radius 71 then Draws a purple line from (460, 232) to (174, 70).
; PLAN: r0=211(x), r1=183(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=232(y1), r7=174(x2), r8=70(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 183
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 232
LDI r7, 174
LDI r8, 70
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
