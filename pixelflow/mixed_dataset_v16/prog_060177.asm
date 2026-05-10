; DESCRIPTION: Composite: Sets a single magenta pixel at (156, 61) then Places a purple line segment connecting (304, 246) to (154, 249).
; PLAN: r0=156(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=246(y1), r7=154(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 246
LDI r7, 154
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
