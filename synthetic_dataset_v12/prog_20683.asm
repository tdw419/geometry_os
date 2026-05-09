; DESCRIPTION: Composite: Creates a magenta rectangular region at (0, 60) spanning 89 by 77 pixels then Places a purple line segment connecting (422, 167) to (443, 193).
; PLAN: r0=0(x), r1=60(y), r2=89(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=167(y1), r7=443(x2), r8=193(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 60
LDI r2, 89
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 167
LDI r7, 443
LDI r8, 193
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
