; DESCRIPTION: Composite: Creates a purple rectangular region at (284, 80) spanning 62 by 50 pixels then Draws a white line from (253, 182) to (425, 91).
; PLAN: r0=284(x), r1=80(y), r2=62(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x1), r6=182(y1), r7=425(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 80
LDI r2, 62
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 182
LDI r7, 425
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
