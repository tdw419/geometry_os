; DESCRIPTION: Composite: Creates a yellow rectangular region at (341, 112) spanning 112 by 40 pixels then Draws a black line from (172, 195) to (50, 36).
; PLAN: r0=341(x), r1=112(y), r2=112(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=195(y1), r7=50(x2), r8=36(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 112
LDI r2, 112
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 195
LDI r7, 50
LDI r8, 36
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
