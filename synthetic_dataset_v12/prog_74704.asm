; DESCRIPTION: Composite: Creates a purple rectangular region at (336, 35) spanning 87 by 112 pixels then Places a green line segment connecting (429, 107) to (270, 11).
; PLAN: r0=336(x), r1=35(y), r2=87(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=107(y1), r7=270(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 35
LDI r2, 87
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 107
LDI r7, 270
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
