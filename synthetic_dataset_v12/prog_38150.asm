; DESCRIPTION: Composite: Sets a single white pixel at (31, 126) then Places a yellow line segment connecting (201, 24) to (186, 153) then Renders a magenta box of size 79x61 starting at (363, 191).
; PLAN: r0=31(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=24(y1), r7=186(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=191(y), r12=79(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 24
LDI r7, 186
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 191
LDI r12, 79
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
