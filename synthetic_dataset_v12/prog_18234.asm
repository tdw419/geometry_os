; DESCRIPTION: Composite: Renders a white line between points (207, 4) and (95, 24) then Renders a black box of size 33x102 starting at (316, 103).
; PLAN: r0=207(x1), r1=4(y1), r2=95(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=103(y), r7=33(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 4
LDI r2, 95
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 103
LDI r7, 33
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
