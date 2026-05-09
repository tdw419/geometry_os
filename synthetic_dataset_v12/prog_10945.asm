; DESCRIPTION: Composite: Draws a green line from (128, 201) to (249, 85) then Renders a white box of size 61x78 starting at (217, 177).
; PLAN: r0=128(x1), r1=201(y1), r2=249(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=177(y), r7=61(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 201
LDI r2, 249
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 177
LDI r7, 61
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
