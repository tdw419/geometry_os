; DESCRIPTION: Composite: Renders a purple line between points (332, 14) and (85, 107) then Places a purple 34x61 rectangle at position (358, 76).
; PLAN: r0=332(x1), r1=14(y1), r2=85(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=76(y), r7=34(width), r8=61(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 14
LDI r2, 85
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 76
LDI r7, 34
LDI r8, 61
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
